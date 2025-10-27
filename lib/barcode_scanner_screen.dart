import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:detrumpezvous/add_product.dart';
import 'package:detrumpezvous/add_product_info_screen.dart';
import 'package:detrumpezvous/criteria_screen.dart';
import 'package:detrumpezvous/edit_contribution_screen.dart';
import 'package:detrumpezvous/report_problem_screen.dart';
import 'package:detrumpezvous/settings_modal.dart';
import 'package:http/http.dart' as http;
import 'package:detrumpezvous/corner_painter.dart';
import 'package:detrumpezvous/generated/l10n.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:logger/logger.dart';
import 'package:translator/translator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:openfoodfacts/openfoodfacts.dart';

final Logger logger = Logger();
final GoogleTranslator translator = GoogleTranslator();

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  BarcodeScannerScreenState createState() => BarcodeScannerScreenState();
}

class BarcodeScannerScreenState extends State<BarcodeScannerScreen>
    with TickerProviderStateMixin {
  // Variables d'état
  String barcode = "";
  String brand = S.current.brandNotFound;
  String description = S.current.descriptionNotFound;
  String parentCompany = S.current.unknown;
  String company = S.current.unknown;
  String parentOrigin = "";
  String origin = "";
  String normalizedName = "";

  String source = S.current.sourceNotFound;
  bool isProductFromUSA = false;
  bool manualSearchUsed = false;
  List<dynamic> brandlist = [];
  bool isProcessing = false; // pour éviter plusieurs scans simultanés
  bool isBrandFound = false; // pour savoir si le produit est dans une liste
  String ingredientsOrigin = ""; // pour savoir si l'origine est US

  bool _isBottomSheetOpen = false; // Empêche l’ouverture en double
  bool _isSheetExpanded = false;

  int _contributionScore = 0; // Score de contribution

  int _democratContribution = 0;
  int _republicanContribution = 0;

  // Contrôleurs
  final TextEditingController manualSearchController = TextEditingController();
  final TextEditingController _newAlternativeController =
      TextEditingController();

  final InAppReview inAppReview = InAppReview.instance;
  int _safeScanCount = 0; // Compteur en mémoire
  int _usaScanCount = 0; // Nouveau compteur pour les produits USA
  bool _reviewHasBeenRequested = false; // Pour ne demander qu'une fois
  bool _isTrumpShowed = true;
  bool _boycottMode = true;

  bool _considerAsAmerican = false;
  bool _isFlashOn = false; // Par défaut, le flash est désactivé

  bool _isContributionModeEnabled = true;

  String? productImageUrl;
  String? productName;

  String _selectedSegment = "company"; // Valeur par défaut

  // Animation
  late AnimationController _shakeController;
  late AnimationController _searchShakeController;

  final MobileScannerController mobileScannerController =
      MobileScannerController(
    formats: [
      BarcodeFormat.ean13,
      BarcodeFormat.ean8,
      BarcodeFormat.upcA,
      BarcodeFormat.upcE,
    ],
  );

  List<AlternativeProduct> _alternativeProducts = [];
  ProductHealthInfo productHealthInfo = ProductHealthInfo();

  // Suggestions / Overlay d'autocomplétion
  List<Map<String, dynamic>> _brandSuggestions = [];
  bool _showBrandSuggestions = false;
  final LayerLink _autocompleteLink = LayerLink();
  final FocusNode _manualSearchFocusNode = FocusNode();
  OverlayEntry? _autocompleteOverlay;
  final GlobalKey _searchAnchorKey = GlobalKey();
  double _suggestionsVerticalOffset = 48;
  double _suggestionsWidth = 0;

  @override
  void initState() {
    super.initState();
    loadBrands();
    _loadCounters();

    // Animation controllers
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _searchShakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Masquer l'overlay quand on perd le focus
    _manualSearchFocusNode.addListener(() {
      if (!_manualSearchFocusNode.hasFocus) {
        _hideSuggestionsOverlay();
        if (mounted) {
          setState(() => _showBrandSuggestions = false);
        }
      }
    });

    // test
    //fetchProductInfo("3523230057950");
    //barcode = "3523230057950";
  }

  @override
  void dispose() {
    _newAlternativeController.dispose();
    manualSearchController.dispose();
    _manualSearchFocusNode.dispose();
    _autocompleteOverlay?.remove();
    _autocompleteOverlay = null;
    _shakeController.dispose();
    _searchShakeController.dispose();
    super.dispose();
  }

  // Demander un avis in-app si disponible
  Future<void> _requestReview() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      await _markReviewRequested();
    }
  }

  // Charger/mettre à jour les compteurs et préférences
  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _boycottMode = prefs.getBool('boycottMode') ?? true;
      _safeScanCount = prefs.getInt('safeScanCount') ?? 0;
      _usaScanCount = prefs.getInt('usaScanCount') ?? 0;
      _reviewHasBeenRequested = prefs.getBool('reviewRequested') ?? false;
      _considerAsAmerican = prefs.getBool('considerAsAmerican') ?? false;
      _contributionScore = prefs.getInt('contributionScore') ?? 0;
      _isContributionModeEnabled = prefs.getBool('contributionMode') ?? true;
      _isTrumpShowed = prefs.getBool('isTrumpShowed') ?? true;
    });
  }

  Future<void> _incrementSafeScanCount() async {
    final prefs = await SharedPreferences.getInstance();
    _safeScanCount++;
    await prefs.setInt('safeScanCount', _safeScanCount);
    setState(() {});
  }

  Future<void> _incrementUsaScanCount() async {
    final prefs = await SharedPreferences.getInstance();
    _usaScanCount++;
    await prefs.setInt('usaScanCount', _usaScanCount);
    setState(() {});
    _shakeController.forward(from: 0.0);
  }

  Future<void> _markReviewRequested() async {
    final prefs = await SharedPreferences.getInstance();
    _reviewHasBeenRequested = true;
    await prefs.setBool('reviewRequested', true);
    setState(() {});
  }

  // Vérifie si les conditions sont remplies pour demander un avis
  void _checkAndRequestReviewIfNeeded() {
    // Ne demande pas si déjà demandé ou si le compte n'est pas atteint
    // Demander après 3, 7, 15 scans "Safe" par exemple
    if (!_reviewHasBeenRequested &&
        (_safeScanCount == 7 || _safeScanCount == 21 || _safeScanCount == 73)) {
      _requestReview();
    }
  }

  // Retourne le fichier local mis à jour ou non
  Future<File> _getLocalFile(String file) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$file.json');
  }

  // Méthode pour charger le fichier mis à jour (ou la version par défaut depuis assets)
  Future<void> loadBrands() async {
    File localFile = await _getLocalFile("brandlist");
    try {
      if (await localFile.exists()) {
        final String contents = await localFile.readAsString();
        brandlist = json.decode(contents);
      } else {
        // Si le fichier n'existe pas, chargez la version embarquée
        final String jsonStr =
            await rootBundle.loadString('assets/brandlist.json');
        brandlist = json.decode(jsonStr);
      }
    } catch (e) {
      // En cas d'erreur, retournez une liste vide ou gérez l'erreur comme vous le souhaitez
      brandlist = [];
    }

    setState(() {});

    // Exemple de recherche d'informations de marque
    //await fetchProductInfo("20724696090");
  }

  /// Vérifie si la chaîne passée correspond aux États‑Unis,
  /// en acceptant plusieurs variantes orthographiques/linguistiques.
  bool checkOrigin(String? origin) {
    if (origin == null) return false;
    final norm = removeDiacritics(origin.trim().toLowerCase());
    const usaVariants = {
      'us',
      'usa',
      'u.s.',
      'u.s.a.',
      'usa.',
      'the united states',
      'the united states of america',
      'us of a',
      'america',
      'les etats unis',
      'les etats-unis',
      'united states',
      'united states of america',
      'united states america',
      'etats unis',
      'etats-unis',
      'etatsunis',
    };
    return usaVariants.contains(norm);
  }

  /// Recherche une information de marque par fuzzy match.
  /// Remplace les virgules par des espaces et normalise la chaîne.
  Future<Map<String, dynamic>> getBrandInfo(String brandName) async {
    // On découpe l'entrée sur les virgules pour obtenir plusieurs candidats
    final List<String> candidates = brandName
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    Map<String, dynamic>?
        americanMatch; // Pour stocker une correspondance américaine si trouvée
    Map<String, dynamic>? notAmericanMatch;

    // Pour chaque candidat, on le normalise et on cherche une correspondance
    for (final candidate in candidates) {
      final String normalizedCandidate = normalizeBrandName(candidate);

      try {
        final Map<String, dynamic> found = brandlist.firstWhere((brand) {
          final String normalizedName =
              (brand["normalizedName"] ?? "").toString().toLowerCase();
          // On vérifie si le champ stocké est identique au candidat normalisé
          return normalizedName == normalizedCandidate;
        }, orElse: () => <String, dynamic>{} // Littérale typée
            );
        if (found.isNotEmpty) {
          if (found["parentOrigin"] == "US" || found["origin"] == "US") {
            americanMatch = found;
          } else {
            notAmericanMatch = found;
          }
        }
      } catch (e) {
        // Au cas où on ne trouve rien pour ce candidat, on passe au suivant
        continue;
      }
    }

    if (americanMatch != null) {
      return americanMatch;
    } else if (notAmericanMatch != null) {
      return notAmericanMatch;
    } else {
// Si aucun des candidats ne correspond, on renvoie un Map vide
      return <String, dynamic>{};
    }
  }

  /// Récupère les informations d'un produit depuis plusieurs API.
  Future<void> fetchProductInfo(String barcode) async {
    productHealthInfo = ProductHealthInfo();
    productImageUrl = "";
    productName = "";
    _alternativeProducts = [];
    List<String?>? foodFactData = await fetchFromOpenFoodFact(barcode);
    String? productData = foodFactData?[0];
    ingredientsOrigin = foodFactData?[1] ?? "";

    productData ??= await fetchFromOpenBeautyFact(barcode);

    productData ??= await fetchFromOpenPetFoodFacts(barcode);

    productData ??= await fetchFromOpenProductFact(barcode);

    await updateProductInfoDetails(productData);
  }

  /// Fonction pour normaliser un nom de marque
  String normalizeBrandName(String input) {
    return removeDiacritics(input
            .toLowerCase()
            .replaceAll("&", "and")) // Transformer les "&" en "and"
        .replaceAll(
            RegExp(r"[’‘`´®™]"), "") // Supprimer les caractères spéciaux
        .replaceAll(RegExp(r"[\s\-‑]+"),
            "_") // Remplacer les espaces et tirets par des underscores
        .replaceAll(RegExp(r"[^a-z0-9_]+"),
            "") // Supprimer tout sauf lettres, chiffres et underscores
        .replaceAll(RegExp(r"_+"),
            "_") // Remplacer plusieurs underscores consécutifs par un seul underscore
        .trim(); // Supprimer les espaces en début/fin
  }

  // Met à jour la liste des suggestions en fonction de la saisie
  void _updateBrandSuggestions(String input) {
    final q = removeDiacritics(input.trim().toLowerCase());
    if (q.length < 2) {
      setState(() {
        _brandSuggestions = [];
        _showBrandSuggestions = false;
      });
      _hideSuggestionsOverlay();
      return;
    }

    final normalizedQ = normalizeBrandName(input);

    // Filtrage basique: correspondances sur name (sans diacritiques) et normalizedName
    final List<Map<String, dynamic>> matches = [];
    for (final dynamic b in brandlist) {
      if (b is Map<String, dynamic>) {
        final name = (b["name"] ?? "").toString();
        final nn = (b["normalizedName"] ?? "").toString().toLowerCase();
        final nameSimple = removeDiacritics(name.toLowerCase());
        if (nameSimple.contains(q) || nn.contains(normalizedQ)) {
          matches.add(b);
        }
      }
      if (matches.length >= 25) break; // limiter pour les perfs
    }

    // Tri: ceux qui commencent par la requête d'abord, puis par longueur
    matches.sort((a, b) {
      final aName =
          removeDiacritics((a["name"] ?? "").toString().toLowerCase());
      final bName =
          removeDiacritics((b["name"] ?? "").toString().toLowerCase());
      final aStarts = aName.startsWith(q) ? 0 : 1;
      final bStarts = bName.startsWith(q) ? 0 : 1;
      if (aStarts != bStarts) return aStarts - bStarts;
      return aName.length.compareTo(bName.length);
    });

    setState(() {
      _brandSuggestions = matches.take(10).toList();
      _showBrandSuggestions = _brandSuggestions.isNotEmpty;
    });

    if (_showBrandSuggestions) {
      _updateOverlayMetrics();
      _showOrUpdateSuggestionsOverlay();
    } else {
      _hideSuggestionsOverlay();
    }
  }

  // Lorsqu'une suggestion est choisie
  Future<void> _onSuggestionSelected(Map<String, dynamic> brand) async {
    final String name = (brand["name"] ?? "").toString();
    manualSearchController.text = name;
    manualSearchController.selection = TextSelection.fromPosition(
      TextPosition(offset: manualSearchController.text.length),
    );
    setState(() {
      _showBrandSuggestions = false;
      manualSearchUsed = true;
      productHealthInfo = ProductHealthInfo();
      productImageUrl = "";
      productName = "";
      _alternativeProducts = [];
    });
    _hideSuggestionsOverlay();
    await updateProductInfoDetails(name);
  }

  // Mesure la taille/position de l'ancre pour dimensionner l'overlay
  void _updateOverlayMetrics() {
    final ctx = _searchAnchorKey.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null) return;
    _suggestionsVerticalOffset = box.size.height + 6;
    _suggestionsWidth = box.size.width;
  }

  void _hideSuggestionsOverlay() {
    _autocompleteOverlay?.remove();
    _autocompleteOverlay = null;
  }

  void _showOrUpdateSuggestionsOverlay() {
    if (_autocompleteOverlay == null) {
      _autocompleteOverlay = _buildOverlayEntry();
      final overlay = Overlay.of(context);
      overlay.insert(_autocompleteOverlay!);
    } else {
      _autocompleteOverlay!.markNeedsBuild();
    }
  }

  OverlayEntry _buildOverlayEntry() {
    return OverlayEntry(builder: (context) {
      if (!_showBrandSuggestions || _brandSuggestions.isEmpty) {
        return const SizedBox.shrink();
      }

      // Debug: affiche la largeur mesurée dans la console (enlève après test)
      // ignore: avoid_print
      print(
          "_suggestionsWidth=$_suggestionsWidth, suggestionsCount=${_brandSuggestions.length}");

      final int displayCount = math.min(_brandSuggestions.length, 5);
      const double rowHeight = 48.0;
      final double overlayWidth =
          (_suggestionsWidth > 0) ? _suggestionsWidth : 280.0;
      final double overlayHeight = rowHeight * displayCount.toDouble();

      return CompositedTransformFollower(
        link: _autocompleteLink,
        showWhenUnlinked: false,
        // s'assurer que le follower s'aligne sur le coin supérieur gauche de la target
        targetAnchor: Alignment.topLeft,
        followerAnchor: Alignment.topLeft,
        offset: Offset(0, _suggestionsVerticalOffset),
        child: Align(
          alignment: Alignment
              .topLeft, // IMPORTANT pour que le SizedBox prenne la largeur donnée
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width:
                  overlayWidth, // largeur forcée à celle mesurée de la search bar
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: overlayHeight,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _brandSuggestions.length,
                    shrinkWrap: true,
                    physics: _brandSuggestions.length > displayCount
                        ? const ClampingScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final b = _brandSuggestions[index];
                      final name = (b["name"] ?? "").toString();
                      final parent = (b["parentCompany"] ?? "").toString();
                      final isUS = (b["parentOrigin"] == "US" ||
                          (b["parentOrigin"] == "" && b["origin"] == "US"));
                      return InkWell(
                        onTap: () => _onSuggestionSelected(b),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    if (parent.isNotEmpty)
                                      Text(
                                        parent,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: isUS
                                      ? Colors.red.shade50
                                      : Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: isUS
                                          ? Colors.red.shade200
                                          : Colors.green.shade200),
                                ),
                                child: Text(
                                  isUS ? S.of(context).usa : S.of(context).safe,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: isUS
                                          ? Colors.red.shade700
                                          : Colors.green.shade700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Exemple de fonction pour interroger l'API OpenBeautyFact.
  Future<String?> fetchFromOpenBeautyFact(String barcode) async {
    final String url =
        'https://world.openbeautyfacts.org/api/v2/product/$barcode.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["product"] != null && data["product"]["brands"] != null) {
          productImageUrl = data["product"]["image_front_url"];
          productName = data["product"]["product_name"];

          return data["product"]["brands"];
        }
      }
    } catch (e, stackTrace) {
      logger.e("Erreur lors de l'appel à OpenBeautyFact",
          error: e, stackTrace: stackTrace);
    }
    return null;
  }

  /// Interroge l'API OpenFoodFacts pour récupérer les informations d'un produit.
  Future<List<String?>?> fetchFromOpenFoodFact(String barcode) async {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: "DeTrumpez-VousApp",
      version: "1.0.0",
      system: "Flutter",
    );

    final ProductQueryConfiguration config = ProductQueryConfiguration(
      barcode,
      version: ProductQueryVersion.v3,
      language: OpenFoodFactsLanguage.FRENCH,
      fields: [
        ProductField.NAME,
        ProductField.NUTRISCORE,
        ProductField.BRANDS,
        ProductField.COUNTRIES,
        ProductField.IMAGE_FRONT_URL,
        ProductField.ALL
      ],
    );
    final ProductResultV3 resultFood =
        await OpenFoodAPIClient.getProductV3(config);

    if (resultFood.product != null && resultFood.product?.brands != null) {
      productHealthInfo = ProductHealthInfo.fromProduct(resultFood.product!);
      productName = resultFood.product?.productName;
      productImageUrl = resultFood.product?.imageFrontUrl;

      // Charger 10 alternatives similaires
      unawaited(_loadAlternativesFromOFF(resultFood.product!));

      return [resultFood.product?.brands, resultFood.product?.origins];
    }

    return null;
  }

  /// Interroge l'API OpenPetFoodFacts pour récupérer les informations d'un produit.
  Future<String?> fetchFromOpenPetFoodFacts(String barcode) async {
    final String url =
        'https://world.openpetfoodfacts.org/api/v0/product/$barcode.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["product"] != null && data["product"]["brands"] != null) {
          productImageUrl = data["product"]["image_front_url"];
          productName = data["product"]["product_name"];

          // Retourne la marque du produit
          return data["product"]["brands"];
        }
      }
    } catch (e, stackTrace) {
      logger.e("Erreur lors de l'appel à OpenPetFoodFacts",
          error: e, stackTrace: stackTrace);
    }
    return null;
  }

  /// Interroge l'API OpenProductFact pour récupérer les informations d'un produit.
  Future<String?> fetchFromOpenProductFact(String barcode) async {
    final String url =
        'https://world.openproductsfacts.org/api/v2/product/$barcode.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["product"] != null && data["product"]["brands"] != null) {
          productImageUrl = data["product"]["image_front_url"];
          productName = data["product"]["product_name"];

          return data["product"]["brands"];
        }
      }
    } catch (e, stackTrace) {
      logger.e("Erreur lors de l'appel à OpenProductFact",
          error: e, stackTrace: stackTrace);
    }
    return null;
  }

  // Modifiez votre fonction onBarcodeDetected pour afficher le popup si le produit n'est pas trouvé.
  Future<void> onBarcodeDetected(String code) async {
    if (code == barcode) return;
    if (isProcessing) return;

    setState(() {
      isProcessing = true;
      barcode = code;
      manualSearchUsed = false; // Réinitialisation ici
    });

    // Afficher une popup de chargement
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: CupertinoActivityIndicator(radius: 20),
          ),
        );
      },
    );

    await fetchProductInfo(code);

    Navigator.pop(context); // Fermer la popup de chargement

    setState(() {
      isProcessing = false;
    });
  }

  Future<void> updateProductInfoDetails(String? productData) async {
    // Recherche d'informations de marque basée sur le champ 'brands'
    final Map<String, dynamic> resultJson =
        await getBrandInfo(productData ?? "");

    // Traduction de la description en fonction de la langue de l'utilisateur
    String? desc;
    if (resultJson["description"] != null) {
      desc = await translateDescriptionIfNeeded(resultJson["description"]);
    }

    setState(() {
      normalizedName = resultJson["normalizedName"] ?? "";
      brand = (resultJson["name"]?.toString().isNotEmpty == true)
          ? resultJson["name"]
          : ((productData?.isNotEmpty == true)
              ? productData!
              : S.of(context).brandNotFound);
      description = desc ?? S.of(context).descriptionNotFound;
      source = resultJson["source"] ?? S.of(context).sourceNotFound;
      parentCompany = resultJson["parentCompany"] ?? S.of(context).unknown;
      company = resultJson["name"] ?? S.of(context).unknown;
      origin = resultJson["origin"] ?? "";
      parentOrigin =
          resultJson["parentOrigin"] ?? ""; // Stocker le pays d'origine
      isProductFromUSA = resultJson["parentOrigin"] == "US";

      if (resultJson["parentOrigin"] == "" && resultJson["origin"] == "US") {
        isProductFromUSA = true;
      }

      isBrandFound = resultJson.isNotEmpty;

      _democratContribution = resultJson["democratContribution"] ?? 0;
      _republicanContribution = resultJson["republicanContribution"] ?? 0;

      /*
      if (resultJson["alternatives"] != null) {
        _alternatives = (resultJson["alternatives"] as List<dynamic>)
            .map((item) => item.toString())
            .toList();
      } else {
        _alternatives = [];
      }*/

      if (_considerAsAmerican &&
          (origin == "US" || checkOrigin(ingredientsOrigin))) {
        isProductFromUSA = true;
      }
    });

    if (isBrandFound) {
      HapticFeedback.mediumImpact();
      if (!isProductFromUSA) {
        // Produit "Safe" trouvé
        await _incrementSafeScanCount();
        _checkAndRequestReviewIfNeeded();
      } else {
        // Produit "USA" trouvé
        await _incrementUsaScanCount(); // Incrémente le compteur USA
      }
    }

    // Si le produit n'a pas été trouvé dans les bases de données d'open food fact, alors suggérer la recherche manuelle
    if (productData == null || productData.isEmpty) {
      _searchShakeController.forward(from: 0.0);
    }

    // Si la marque n'est pas trouvée dans les listes, l'envoyer sur Firebase
    /*if (!isBrandFound &&
        productData != null &&
        productData.isNotEmpty &&
        !manualSearchUsed) {
      await FirebaseFirestore.instance.collection('unknown_brands').add({
        'brand_name': productData,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }*/

    // Déclenche un retour haptique (vibration légère)
    if (isBrandFound) {
      HapticFeedback.mediumImpact();
    } else if (productData == null || productData.isEmpty) {
      // --- MODIFICATION ICI ---
      // Vérifier si la sheet n'est PAS déjà ouverte OU en cours d'ouverture AVANT de programmer le callback
      if (!_isBottomSheetOpen && _isContributionModeEnabled) {
        // Marquer immédiatement que l'ouverture est en cours pour éviter les appels concurrents
        _isBottomSheetOpen = true;

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          // Vérifier si le widget est toujours monté DANS le callback
          if (mounted) {
            final String currentBarcode = barcode; // Stocker avant l'await

            try {
              // Attend que la bottom sheet soit fermée
              await showModalBottomSheet(
                context: context,
                enableDrag: true,
                isDismissible: true,
                isScrollControlled: true,
                backgroundColor: Colors.grey.shade100,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext sheetContext) {
                  return FractionallySizedBox(
                    heightFactor: 0.85,
                    child: AddProduct(
                      barcode: currentBarcode,
                    ),
                  );
                },
              );
              final prefs = await SharedPreferences.getInstance();
              setState(() {
                _contributionScore = prefs.getInt('contributionScore') ?? 0;
              });
            } finally {
              // Ce bloc s'exécute même si showModalBottomSheet lève une exception
              // ou si l'utilisateur ferme la sheet.

              // Important : Remettre le flag à false UNIQUEMENT APRES la fermeture
              // et vérifier si le widget est toujours monté
              if (mounted) {
                _isBottomSheetOpen = false; // Permettre une nouvelle ouverture
                setState(() {
                  barcode = ""; // Réinitialise le code-barres après fermeture
                });
              } else {
                // Si le widget n'est plus monté pendant que la sheet était ouverte,
                // il faut quand même réinitialiser le flag pour éviter un blocage
                // si l'écran est recréé plus tard.
                _isBottomSheetOpen = false;
              }
            }
          } else {
            // Si le widget n'est plus monté au moment où le callback s'exécute,
            // il faut s'assurer que le flag est remis à false.
            _isBottomSheetOpen = false;
          }
        });
      } // Fin du if (!_isBottomSheetOpen)
    }
  }

  /// Fonction qui traduit une chaîne de caractères si la langue cible n'est pas le français
  Future<String> translateDescriptionIfNeeded(String text) async {
    final String locale = Localizations.localeOf(context).languageCode;
    if (locale != 'fr') {
      try {
        final translation = await translator.translate(text, to: locale);
        return translation.text;
      } catch (e) {
        // En cas d'erreur, retourner le texte original
        return text;
      }
    }
    return text;
  }

  Widget buildNutriScoreSvg(String nutriscore) {
    final letter = nutriscore.toLowerCase();
    return SvgPicture.asset(
      'assets/nutriscore/nutriscore_$letter.svg',
      width: 80,
      height: 40,
    );
  }

  // Fonction helper pour obtenir le widget du drapeau
  Widget _getFlagWidget(String countryCode) {
    if (countryCode != "") {
      try {
        // Utilise le package country_flags pour afficher le drapeau
        return CountryFlag.fromCountryCode(
          countryCode,
          height: 24,
          width: 40, // Ajustez la largeur si nécessaire pour le ratio
        );
      } catch (e) {
        // Si le code pays n'est pas valide pour le package
        logger.w(
            "Code pays '$countryCode' invalide pour le package country_flags: $e");
        return const Icon(Icons.business, size: 32, color: Colors.grey);
      }
    } else {
      // Si la valeur d'origine n'est pas dans notre map de conversion
      logger.w("Code pays non trouvé dans la map pour: '$countryCode'");
      return const Icon(Icons.business, size: 32, color: Colors.grey);
    }
  }

  Future<bool> _isBrandAmerican(String brandName) async {
    final Map<String, dynamic> info = await getBrandInfo(brandName);

    if (info.isEmpty) return true;

    // Vérifiez si "parentOrigin" ou "origin" est "US"
    final String? parentOrigin = info["parentOrigin"]?.toString();
    final String? origin = info["origin"]?.toString();

    return parentOrigin == "US" || origin == "US";
  }

  // Helpers filtrage OFF
  List<String> _asStringList(dynamic v) {
    if (v is List) {
      return v.map((e) => e.toString().toLowerCase()).toList();
    }
    return const <String>[];
  }

  int _categoryOverlap(List<String>? a, List<String>? b) {
    final sa = (a ?? const <String>[]).map((e) => e.toLowerCase()).toSet();
    final sb = (b ?? const <String>[]).map((e) => e.toLowerCase()).toSet();
    if (sa.isEmpty || sb.isEmpty) return 0;
    return sa.intersection(sb).length;
  }

  Future<void> _loadAlternativesFromOFF(Product base, {int limit = 10}) async {
    try {
      // Récupération robuste des PNNS depuis le JSON
      final Map<String, dynamic> baseJson =
          (base.toJson() as Map).cast<String, dynamic>();
      final String? basePnns =
          (baseJson['pnns_groups_2'] as String?)?.toString();
      final List<String> basePnnsTags = (baseJson['pnns_groups_2_tags'] is List)
          ? (baseJson['pnns_groups_2_tags'] as List)
              .map((e) => e.toString())
              .toList()
          : const <String>[];
      // Tag PNNS à utiliser pour la recherche (priorité aux tags normalisés)
      final String? pnnsFilter =
          basePnnsTags.isNotEmpty ? basePnnsTags.first : basePnns;

      final List<String>? baseCats = base.categoriesTags?.cast<String>();
      final String? mainCategory =
          (baseCats != null && baseCats.isNotEmpty) ? baseCats.last : null;

      final String baseCode = base.barcode ?? "";
      final String baseBrand = (base.brands ?? "").trim();

      // On demande plus de résultats pour compenser le filtrage
      final params = <String, String>{
        "search_simple": "1",
        "action": "process",
        "json": "1",
        "page_size": "60",
        "fields":
            "code,product_name,product_name_fr,brands,image_front_url,categories_tags,countries_tags,pnns_groups_2,pnns_groups_2_tags",
      };

      // 1) Marché FR
      params.addAll({
        "tagtype_0": "countries",
        "tag_contains_0": "contains",
        "tag_0": "France",
      });

      // 2) Similarité: PNNS si dispo, sinon catégorie, sinon nom/marque
      if (pnnsFilter != null && pnnsFilter.isNotEmpty) {
        params.addAll({
          "tagtype_1": "pnns_groups_2",
          "tag_contains_1": "contains",
          "tag_1": pnnsFilter,
        });
      } else if (mainCategory != null && mainCategory.isNotEmpty) {
        params.addAll({
          "tagtype_1": "categories",
          "tag_contains_1": "contains",
          "tag_1": mainCategory,
        });
      } else if ((base.productName ?? "").isNotEmpty) {
        params["search_terms"] = base.productName!;
      } else if (baseBrand.isNotEmpty) {
        params["search_terms"] = baseBrand;
      }

      final uri =
          Uri.https("world.openfoodfacts.org", "/cgi/search.pl", params);
      final resp = await http.get(uri);
      if (resp.statusCode != 200) return;

      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      final List products = (data["products"] as List?) ?? [];

      final List<AlternativeProduct> out = [];
      for (final p in products) {
        final map = (p as Map).cast<String, dynamic>();

        final code = (map["code"] ?? "").toString();
        if (code.isEmpty || code == baseCode) continue;

        // Vendu en France
        //if (!_soldInFrance(map["countries_tags"])) continue;

        // Filtrage de similarité
        if (pnnsFilter == null || pnnsFilter.isEmpty) {
          // Pas de PNNS: on exige un chevauchement de catégories
          final candCats = _asStringList(map["categories_tags"]);
          if (_categoryOverlap(baseCats, candCats) == 0) continue;
        } else {
          // PNNS demandé: vérifier cohérence via tag ou label
          final String candPnns = (map['pnns_groups_2'] ?? '').toString();
          final List<String> candPnnsTags =
              _asStringList(map['pnns_groups_2_tags']);
          final String pnnsLower = pnnsFilter.toLowerCase();
          final bool samePnns = candPnns.toLowerCase() == pnnsLower ||
              candPnnsTags.contains(pnnsLower);
          if (!samePnns) continue;
        }

        // Champs d’affichage
        final nameFr = (map["product_name_fr"] ?? "").toString();
        final name =
            nameFr.isNotEmpty ? nameFr : (map["product_name"] ?? "").toString();
        final brands = (map["brands"] ?? "").toString();
        final img = (map["image_front_url"] ?? "").toString();
        if (name.isEmpty && brands.isEmpty) continue;

        final bool isUS = await _isBrandAmerican(brands);
        if (isUS) continue;

        out.add(AlternativeProduct(
          code: code,
          name: name,
          brand: brands,
          imageUrl: img,
          isAmerican: isUS,
        ));
      }

      // Dédup + limite 10
      final seen = <String>{};
      final dedup = out.where((e) => seen.add(e.code)).take(limit).toList();

      if (mounted) {
        setState(() {
          _alternativeProducts = dedup;
        });
      }
    } catch (e, st) {
      logger.e("Erreur chargement alternatives OFF", error: e, stackTrace: st);
    }
  }

  Color _getCounterColor(int count) {
    // Définissez une valeur maximale pour atteindre le rouge complet
    const double maxCountForFullRed =
        100.0; // Ajustez cette valeur si nécessaire
    // Calculez le facteur d'interpolation (entre 0.0 et 1.0)
    final double t = (count / maxCountForFullRed).clamp(0.0, 1.0);
    // Interpolez entre le noir et le rouge
    return Color.lerp(Colors.black, Colors.red.shade700, t) ??
        Colors.black; // Fournir une couleur par défaut
  }

  // ignore: unused_element
  Widget _buildPartyContributionGauge(BuildContext context) {
    final int totalPartyContributions =
        _democratContribution + _republicanContribution;

    return GestureDetector(
      onTap: () {
        // Ouvrir la page d'édition des contributions
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditContributionsScreen(
              initialDemocratContribution: _democratContribution,
              initialRepublicanContribution: _republicanContribution,
              companyName: company,
              normalizedName: normalizedName,
            ),
          ),
        ).then((_) async {
          // Recharger les contributions après la fermeture de la page
          final prefs = await SharedPreferences.getInstance();
          setState(() {
            _contributionScore = prefs.getInt('contributionScore') ?? 0;
          });
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).politicalContributionsTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(S.of(context).editContributionsButtonLabel,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (totalPartyContributions == 0)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    S.of(context).noPoliticalContributionsYet,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Row(
                  children: [
                    if (_democratContribution > 0)
                      Expanded(
                        flex: _democratContribution,
                        child: Container(
                          height: 20,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    if (_republicanContribution > 0)
                      Expanded(
                        flex: _republicanContribution,
                        child: Container(
                          height: 20,
                          color: Colors.red.shade700,
                        ),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).democratsLabel,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${NumberFormat('#,##0').format(_democratContribution)} \$",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      S.of(context).republicansLabel,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${NumberFormat('#,##0').format(_republicanContribution)} \$",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsModal(BuildContext context) async {
    await showCupertinoModalBottomSheet<bool>(
      context: context,
      expand: false,
      builder: (_) => SettingsModal(
        barcode: barcode,
        brand: brand,
      ),
    ).then((_) async {
      _loadCounters();
    });
  }

  Widget buildInfoRow({
    required BuildContext context,
    required String countryCode,
    IconData? icon,
    required String title,
    required String value,
    required Color badgeColor,
    String? additionalValue,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          (countryCode.isNotEmpty)
              ? _getFlagWidget(countryCode)
              : Container(
                  width: 40,
                  child: Icon(
                    icon ?? CupertinoIcons.building_2_fill,
                    size: 32,
                    color: badgeColor,
                  ),
                ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            additionalValue ?? "",
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          const SizedBox(width: 8),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildInfoRowsWithDivider(List<Map<String, dynamic>> infos) {
    final List<Widget> rows = [];
    for (int i = 0; i < infos.length; i++) {
      if (infos[i]["show"]) {
        rows.add(buildInfoRow(
          context: context,
          countryCode: infos[i]["countryCode"] ?? "",
          icon: infos[i]["icon"],
          title: infos[i]["title"],
          value: infos[i]["value"],
          additionalValue: infos[i]["additionalValue"] ?? "",
          badgeColor: infos[i]["badgeColor"],
        ));
        // Ajouter un Divider sauf après le dernier élément
        if (i < infos.length - 1) {
          rows.add(const Divider(
            height: 16,
            thickness: 0.5,
            indent: 52,
            endIndent: 0,
          ));
        }
      }
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    // 1. Prépare la liste des infos à afficher
    final List<Map<String, dynamic>> infos = [
      {
        "show": parentOrigin.isNotEmpty,
        "isDefaut": parentOrigin == "US",
        "countryCode": parentOrigin,
        "icon": CupertinoIcons.building_2_fill,
        "title": S.of(context).parentCompanyLabel,
        "value": parentCompany,
        "badgeColor": parentOrigin == "US" ? Colors.red : Colors.green,
      },
      {
        "show": origin.isNotEmpty,
        "isDefaut": origin == "US",
        "countryCode": origin,
        "icon": CupertinoIcons.building_2_fill,
        "title": S.of(context).companyLabel,
        "value": company,
        "badgeColor": origin == "US" ? Colors.red : Colors.green,
      },
      {
        "show": ingredientsOrigin.isNotEmpty,
        "isDefaut": checkOrigin(ingredientsOrigin),
        "countryCode": ingredientsOrigin,
        "icon": CupertinoIcons.cube_box,
        "title": S.of(context).ingredientsOriginLabel,
        "value": ingredientsOrigin,
        "badgeColor":
            checkOrigin(ingredientsOrigin) ? Colors.red : Colors.green,
      },
    ];

    var nutritionInfos = productHealthInfo.toNutritionInfos();

    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaPadding =
        MediaQuery.of(context).padding; // Obtenir les paddings de la safe area

    return Scaffold(
      body: Stack(
        children: [
          // La zone supérieure limitée à 70 % de l'écran (Scanner)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.72,
            child: Stack(
              children: [
                MobileScanner(
                  controller: mobileScannerController,
                  onDetect: (BarcodeCapture capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    if (barcodes.isNotEmpty &&
                        !isProcessing &&
                        !_isBottomSheetOpen &&
                        !_isSheetExpanded) {
                      final String code = barcodes.first.rawValue ?? '';
                      if (code.isNotEmpty) {
                        onBarcodeDetected(code);
                      }
                    }
                  },
                ),
                Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: const Size(280, 140),
                          painter: CornerPainter(
                            color: Colors.grey,
                            lineWidth: 3,
                            cornerLength: 20,
                            cornerRadius: 8.0,
                          ),
                        ),
                        Opacity(
                          opacity: 0.5, // opacité de 80%
                          child: Image.asset(
                            "assets/barcode.png", // chemin de votre image PNG avec fond transparent
                            width: 200, // ajustez la taille selon vos besoins
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        S.of(context).scanBarcodeLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight:
                              FontWeight.w500, // Légèrement plus visible
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Positioned(
            top: safeAreaPadding.top + 10,
            left: 15, // Positionné à gauche
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50, // Fond bleu clair
                  borderRadius: BorderRadius.circular(20), // Coins arrondis
                  border: Border.all(
                    color: Colors.blue.shade300, // Bordure bleue
                    width: 1.0, // Réduction de l'épaisseur de la bordure
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3, // Réduction du flou
                      offset: const Offset(0, 1), // Réduction de l'ombre
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 10, // Réduction de la taille de l'avatar
                      backgroundColor: Colors.blue.shade100, // Fond bleu clair
                      child: const Icon(
                        Icons
                            .star, // Icône étoile pour symboliser la contribution
                        color: Colors.blue, // Couleur bleue pour l'icône
                        size: 14, // Réduction de la taille de l'icône
                      ),
                    ),
                    const SizedBox(
                        width:
                            6), // Réduction de l'espace entre l'icône et le texte
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        "$_contributionScore",
                        key: ValueKey<int>(_contributionScore),
                        style: const TextStyle(
                          fontSize: 14, // Réduction de la taille du texte
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Couleur bleue pour le score
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
// Bouton pour activer/désactiver le flash
          Positioned(
            top: safeAreaPadding.top + 10,
            right: 15,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  _isFlashOn = !_isFlashOn; // Inverse l'état du flash
                });
                mobileScannerController
                    .toggleTorch(); // Active/désactive le flash
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  _isFlashOn
                      ? Icons.flash_on // Icône pour flash activé
                      : Icons.flash_off, // Icône pour flash désactivé
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),

          // --- NOUVEAU WIDGET COMPTEUR ---

          Positioned(
              top: safeAreaPadding.top + 10,
              right: 64,
              // Enveloppe avec AnimatedBuilder pour le tremblement
              child: GestureDetector(
                onTap: () async {
                  // Afficher le compteur en grand au milieu de l'écran
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 24,
                                    ),
                                    Row(
                                      children: [
                                        (_boycottMode)
                                            ? GestureDetector(
                                                onTap: () async {
                                                  final prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  setState(() {
                                                    _isTrumpShowed =
                                                        !_isTrumpShowed;
                                                  });
                                                  await prefs.setBool(
                                                      'isTrumpShowed',
                                                      _isTrumpShowed);
                                                },
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage:
                                                      (_isTrumpShowed)
                                                          ? const AssetImage(
                                                              "assets/trump.jpg")
                                                          : const AssetImage(
                                                              "assets/usa.png"),
                                                ),
                                              )
                                            : Container(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            80)),
                                                child: const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 80,
                                                ),
                                              ),
                                        Text(
                                          (_boycottMode)
                                              ? "${S.of(context).xPrefix} $_usaScanCount"
                                              : "${S.of(context).xPrefix} $_safeScanCount",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                _getCounterColor(_usaScanCount),
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(
                                            context); // Fermer la popup
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          size: 24,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).counterTitle,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Switch(
                                      value: _boycottMode,
                                      onChanged: (bool value) async {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        setState(() {
                                          _boycottMode = value;
                                        });
                                        await prefs.setBool(
                                            'boycottMode', value);

                                        Navigator.pop(
                                            context); // Fermer la boîte de dialogue
                                      },
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    setState(() {
                                      _usaScanCount = 0;
                                      _safeScanCount = 0;
                                    });
                                    await prefs.setInt('usaScanCount', 0);
                                    await prefs.setInt('safeScanCount', 0);

                                    Navigator.pop(
                                        context); // Fermer la boîte de dialogue

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            S.of(context).resetSuccessSnack),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red.shade700,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    S.of(context).resetButton,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: AnimatedBuilder(
                  animation: _shakeController,
                  builder: (context, child) {
                    // Calculer le décalage horizontal basé sur l'animation
                    // Utilise sin() pour un effet de va-et-vient
                    final double dx =
                        math.sin(_shakeController.value * math.pi * 4) *
                            4; // 4 cycles, amplitude 4 pixels
                    return Transform.translate(
                      offset: Offset(dx, 0), // Applique le décalage horizontal
                      child: child, // Le contenu original du compteur
                    );
                  },
                  // Le contenu original du compteur est maintenant le 'child' de AnimatedBuilder
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (_boycottMode)
                            ? CircleAvatar(
                                radius: 12,
                                backgroundImage: (_isTrumpShowed)
                                    ? const AssetImage("assets/trump.jpg")
                                    : const AssetImage("assets/usa.png"),
                              )
                            : Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                        const SizedBox(width: 6),
                        Text(S.of(context).xPrefix),
                        const SizedBox(width: 4),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: Text(
                            (_boycottMode)
                                ? "$_usaScanCount"
                                : "$_safeScanCount",
                            key: ValueKey<int>(_usaScanCount),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _getCounterColor(_usaScanCount),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          // --- FIN NOUVEAU WIDGET COMPTEUR ---

          // DraggableScrollableSheet toujours affiché en bas
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              // Vérifie si la sheet est proche de sa taille maximale
              final bool expanded = notification.extent >
                  (notification.maxExtent - 0.05); // Seuil de 5%
              if (expanded != _isSheetExpanded) {
                setState(() {
                  _isSheetExpanded = expanded;
                });
              }
              return true; // Indique que la notification a été gérée
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.30,
              minChildSize: 0.30,
              maxChildSize: 0.90,
              snap: true,
              builder: (context, scrollController) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                            controller: scrollController,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight),
                              child: IntrinsicHeight(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Column(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                right: 16,
                                                left: 16,
                                                bottom: 16),
                                            decoration: BoxDecoration(
                                              color: !isBrandFound
                                                  ? Colors.grey.shade100
                                                  : (!isProductFromUSA
                                                      ? Colors.green.shade100
                                                      : Colors.red.shade100),
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      top: Radius.circular(16)),
                                            ),
                                            child: Column(children: [
                                              // Indicateur de glissement style iOS
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Center(
                                                child: Container(
                                                  width: 48,
                                                  height: 6,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade400,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              // Champ de recherche manuelle

                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 8),
                                                child: Row(children: [
                                                  Expanded(
                                                    child: AnimatedBuilder(
                                                      animation:
                                                          _searchShakeController,
                                                      builder:
                                                          (context, child) {
                                                        // Calculer le décalage horizontal basé sur l'animation
                                                        final double dx = math.sin(
                                                                _searchShakeController
                                                                        .value *
                                                                    math.pi *
                                                                    6) *
                                                            8;
                                                        return Transform
                                                            .translate(
                                                          offset: Offset(dx, 0),
                                                          child: child,
                                                        );
                                                      },
                                                      child:
                                                          CompositedTransformTarget(
                                                        link: _autocompleteLink,
                                                        child: Container(
                                                          key: _searchAnchorKey,
                                                          child:
                                                              CupertinoSearchTextField(
                                                            controller:
                                                                manualSearchController,
                                                            focusNode:
                                                                _manualSearchFocusNode,
                                                            placeholder: S
                                                                .of(context)
                                                                .manualSearchPlaceholder,
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16),
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[200],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            onChanged: (value) {
                                                              _updateBrandSuggestions(
                                                                  value);
                                                            },
                                                            onSubmitted:
                                                                (value) async {
                                                              final String
                                                                  brand =
                                                                  value.trim();
                                                              setState(() {
                                                                _showBrandSuggestions =
                                                                    false;
                                                              });
                                                              _hideSuggestionsOverlay();
                                                              if (brand
                                                                  .isNotEmpty) {
                                                                setState(() {
                                                                  manualSearchUsed =
                                                                      true;
                                                                });
                                                                productHealthInfo =
                                                                    ProductHealthInfo();
                                                                productImageUrl =
                                                                    "";
                                                                productName =
                                                                    "";
                                                                _alternativeProducts =
                                                                    [];
                                                                await updateProductInfoDetails(
                                                                    brand);
                                                              }
                                                            },
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        12,
                                                                    vertical:
                                                                        10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _showSettingsModal(
                                                          context);
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[
                                                            200], // Couleur de fond du bouton
                                                        shape: BoxShape
                                                            .circle, // Forme ronde
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 1,
                                                            blurRadius: 3,
                                                            offset: const Offset(
                                                                0,
                                                                1), // Ombre légère
                                                          ),
                                                        ],
                                                      ),
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .settings, // Icône de paramètres iOS
                                                        color: Colors.grey[
                                                            700], // Couleur de l'icône
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                              if (!isBrandFound &&
                                                  manualSearchUsed)
                                                Text(
                                                  S.of(context).searchWarning,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.red),
                                                ),
                                              const SizedBox(height: 8),
                                              // Autres widgets d'affichage produit...
                                              IntrinsicHeight(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch, // Important !
                                                  children: [
                                                    if (productImageUrl !=
                                                            null &&
                                                        productImageUrl!
                                                            .isNotEmpty)
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        child: Image.network(
                                                          productImageUrl!,
                                                          width: 120,
                                                          height: 120,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              const Icon(Icons
                                                                  .image_not_supported),
                                                        ),
                                                      )
                                                    else
                                                      GestureDetector(
                                                        onTap: () async {
                                                          if (isBrandFound &&
                                                              isProductFromUSA) {
                                                            final prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            setState(() {
                                                              _isTrumpShowed =
                                                                  !_isTrumpShowed;
                                                            });
                                                            await prefs.setBool(
                                                                'isTrumpShowed',
                                                                _isTrumpShowed);
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 96,
                                                          height: 96,
                                                          decoration: !isBrandFound
                                                              ? const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .grey,
                                                                )
                                                              : (!isProductFromUSA
                                                                  ? const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image:
                                                                          DecorationImage(
                                                                        image: (_isTrumpShowed)
                                                                            ? const AssetImage("assets/trump.jpg")
                                                                            : const AssetImage("assets/usa.png"),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    )),
                                                          child: !isBrandFound
                                                              ? const Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 80,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : (!isProductFromUSA
                                                                  ? const Icon(
                                                                      Icons
                                                                          .check,
                                                                      size: 80,
                                                                      color: Colors
                                                                          .white,
                                                                    )
                                                                  : Container()),
                                                        ),
                                                      ),
                                                    const SizedBox(width: 16),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 4),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return AlertDialog(
                                                                                title: Text(S.of(context).informationTitle),
                                                                                content: Column(mainAxisSize: MainAxisSize.min, children: [
                                                                                  Text(
                                                                                    description,
                                                                                    textAlign: TextAlign.justify,
                                                                                  ),
                                                                                  const SizedBox(height: 8),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        "($source)",
                                                                                        style: const TextStyle(fontSize: 14, color: Colors.blue),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ]),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context); // Fermer la popup
                                                                                    },
                                                                                    child: Text(S.of(context).close),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            RichText(
                                                                          text:
                                                                              TextSpan(
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.black, // ou la couleur de ton thème
                                                                            ),
                                                                            children: [
                                                                              TextSpan(
                                                                                text: brand,
                                                                              ),
                                                                              WidgetSpan(
                                                                                alignment: PlaceholderAlignment.middle,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.only(left: 8),
                                                                                  child: Icon(
                                                                                    Icons.info_outline,
                                                                                    color: Colors.blue,
                                                                                    size: 20,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                      if (productName !=
                                                                              null &&
                                                                          productName!
                                                                              .isNotEmpty)
                                                                        Text(
                                                                          productName ??
                                                                              "",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.grey.shade600,
                                                                          ),
                                                                        )
                                                                      else
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(bottom: 4.0),
                                                                          child: Text(
                                                                              !isBrandFound ? S.of(context).unknownProductMessage : (!isProductFromUSA ? S.of(context).safeProductMessage : S.of(context).usaProductMessage),
                                                                              style: TextStyle(
                                                                                fontSize: 14,
                                                                                color: !isBrandFound ? Colors.grey : (!isProductFromUSA ? Colors.green : Colors.red),
                                                                              )),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (productHealthInfo
                                                                        .nutriScoreGrade !=
                                                                    null)
                                                                  buildNutriScoreSvg(
                                                                      productHealthInfo
                                                                          .nutriScoreGrade!)
                                                              ],
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: !isBrandFound
                                                                        ? Colors
                                                                            .grey
                                                                        : (!isProductFromUSA
                                                                            ? Colors.green
                                                                            : Colors.red),
                                                                    width: 2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Text(
                                                                !isBrandFound
                                                                    ? S
                                                                        .of(
                                                                            context)
                                                                        .unknown
                                                                    : (!isProductFromUSA
                                                                        ? S
                                                                            .of(
                                                                                context)
                                                                            .safe
                                                                        : S
                                                                            .of(context)
                                                                            .usa),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  color: !isBrandFound
                                                                      ? Colors
                                                                          .grey
                                                                      : (!isProductFromUSA
                                                                          ? Colors
                                                                              .green
                                                                          : Colors
                                                                              .red),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ])),
                                        Container(
                                            padding: const EdgeInsets.only(
                                                right: 16, left: 16),
                                            child: Column(children: [
                                              const SizedBox(height: 16),
                                              CupertinoSlidingSegmentedControl<
                                                  String>(
                                                groupValue: _selectedSegment,
                                                onValueChanged:
                                                    (String? value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      _selectedSegment = value;
                                                    });
                                                  }
                                                },
                                                children: {
                                                  "company": Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16),
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .companyLabel, // Texte pour "Entreprise"
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  "health": Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16),
                                                    child: Text(
                                                      S
                                                          .of(context)
                                                          .healthLabel, // Texte pour "Santé"
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                },
                                              ),
                                              const SizedBox(height: 16),
                                              // 2. Affiche les défauts
                                              if (_selectedSegment == "company")
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Titre "Défauts"
                                                    if (infos
                                                        .where((e) =>
                                                            e["show"] == true)
                                                        .isEmpty)
                                                      Text(
                                                        S.of(context).noInfo,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey),
                                                      ),
                                                    if (infos
                                                        .where((e) =>
                                                            e["isDefaut"])
                                                        .isNotEmpty)
                                                      Column(children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            S
                                                                .of(context)
                                                                .defectsTitle,
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        ...buildInfoRowsWithDivider(
                                                          infos
                                                              .where((e) =>
                                                                  e["isDefaut"])
                                                              .toList(),
                                                        ),
                                                        const SizedBox(
                                                            height: 24),
                                                      ]),

                                                    // Titre "Qualités"
                                                    if (infos
                                                        .where((e) =>
                                                            e["show"] == true &&
                                                            !e["isDefaut"])
                                                        .isNotEmpty)
                                                      Column(children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            S
                                                                .of(context)
                                                                .qualitiesTitle,
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        ...buildInfoRowsWithDivider(
                                                          infos
                                                              .where((e) => !e[
                                                                  "isDefaut"])
                                                              .toList(),
                                                        ),
                                                      ])
                                                  ],
                                                ),
                                              if (_selectedSegment == "health")
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (nutritionInfos.isEmpty)
                                                      Text(
                                                        S
                                                            .of(context)
                                                            .noHealthInfo,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey),
                                                      ),
                                                    // Titre "Défauts"
                                                    if (nutritionInfos
                                                        .where((e) =>
                                                            e["isDefaut"])
                                                        .isNotEmpty)
                                                      Column(children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            S
                                                                .of(context)
                                                                .defectsTitle,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        ...buildInfoRowsWithDivider(
                                                          nutritionInfos
                                                              .where((e) =>
                                                                  e["isDefaut"])
                                                              .toList(),
                                                        ),
                                                        const SizedBox(
                                                            height: 24),
                                                      ]),
// Titre "Qualités
                                                    if (nutritionInfos
                                                        .where((e) =>
                                                            !e["isDefaut"])
                                                        .isNotEmpty)
                                                      Column(children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            S
                                                                .of(context)
                                                                .qualitiesTitle,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        ...buildInfoRowsWithDivider(
                                                          nutritionInfos
                                                              .where((e) => !e[
                                                                  "isDefaut"])
                                                              .toList(),
                                                        ),
                                                      ])
                                                  ],
                                                ),
                                            ])),
                                        /*
                                        const SizedBox(height: 24),
                                        Container(
                                            // Ajout de la décoration pour les coins arrondis et l'ombre
                                            decoration: BoxDecoration(
                                              color: Colors
                                                  .white, // Conserve le fond blanc
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      12), // Coins arrondis
                                              boxShadow: [
                                                // Ajout de l'ombre pour l'effet surélevé
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(
                                                      0.3), // Couleur de l'ombre
                                                  spreadRadius:
                                                      1, // Étendue de l'ombre
                                                  blurRadius:
                                                      5, // Flou de l'ombre
                                                  offset: const Offset(0,
                                                      3), // Position de l'ombre (x, y)
                                                ),
                                              ],
                                            ),
                                            padding: const EdgeInsets.all(
                                                12), // Ajout de padding interne
                                            child: Column(children: [
                                              (parentOrigin != "")
                                                  ? Column(children: [
                                                      Row(children: [
                                                        // Vous pourriez ajouter une icône ici si pertinent
                                                        (parentOrigin != "")
                                                            ? _getFlagWidget(
                                                                parentOrigin)
                                                            : const Icon(
                                                                CupertinoIcons
                                                                    .building_2_fill,
                                                                size: 32,
                                                                color: Colors
                                                                    .grey),
                                                        const SizedBox(
                                                            width: 12),
                                                        Expanded(
                                                            // Utiliser Expanded pour que la colonne prenne l'espace
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start, // Aligner le texte à gauche
                                                                children: [
                                                              Text(
                                                                  S
                                                                      .of(
                                                                          context)
                                                                      .parentCompanyLabel,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)), // Style du titre
                                                              const SizedBox(
                                                                  height:
                                                                      2), // Espace entre titre et valeur
                                                              Text(
                                                                  parentCompany,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14)) // Style de la valeur
                                                            ])),
                                                        Container(
                                                          width: 20,
                                                          height: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                (parentOrigin ==
                                                                        "US")
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .green,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            (parentOrigin ==
                                                                    "US")
                                                                ? CupertinoIcons
                                                                    .clear
                                                                : CupertinoIcons
                                                                    .check_mark,
                                                            size: 12,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ]),
                                                      const SizedBox(height: 8),
                                                      const Divider(
                                                          indent: 16,
                                                          endIndent: 16,
                                                          height: 1),
                                                      const SizedBox(height: 8),
                                                    ])
                                                  : Container(),
                                              Row(children: [
                                                // Vous pourriez ajouter une icône ici si pertinent
                                                (origin != "")
                                                    ? _getFlagWidget(origin)
                                                    : const Icon(
                                                        CupertinoIcons
                                                            .building_2_fill,
                                                        size: 32,
                                                        color: Colors.grey),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                    // Utiliser Expanded pour que la colonne prenne l'espace
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start, // Aligner le texte à gauche
                                                        children: [
                                                      Text(
                                                          S
                                                              .of(context)
                                                              .companyLabel,
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .bold)), // Style du titre
                                                      const SizedBox(
                                                          height:
                                                              2), // Espace entre titre et valeur
                                                      Text(company,
                                                          style: const TextStyle(
                                                              fontSize:
                                                                  14)) // Style de la valeur
                                                    ])),
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: (origin == "US")
                                                        ? Colors.red
                                                        : Colors.green,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    (origin == "US")
                                                        ? CupertinoIcons.clear
                                                        : CupertinoIcons
                                                            .check_mark,
                                                    size: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ]),
                                              (isIngredientsOriginFromUS)
                                                  ? Column(
                                                      children: [
                                                        const SizedBox(
                                                            height: 8),
                                                        const Divider(
                                                            indent: 16,
                                                            endIndent: 16,
                                                            height: 1),
                                                        const SizedBox(
                                                            height: 8),
                                                        Row(children: [
                                                          // Vous pourriez ajouter une icône ici si pertinent
                                                          _getFlagWidget("US"),
                                                          const SizedBox(
                                                              width: 12),
                                                          Expanded(
                                                              // Utiliser Expanded pour que la colonne prenne l'espace
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start, // Aligner le texte à gauche
                                                                  children: [
                                                                Text(
                                                                    S
                                                                        .of(
                                                                            context)
                                                                        .ingredientsOriginLabel,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold)), // Style du titre
                                                                const SizedBox(
                                                                    height:
                                                                        2), // Espace entre titre et valeur
                                Text(
                                  S.of(context).usa,
                                  style: const TextStyle(
                                    fontSize:
                                      14)) // Style de la valeur
                                                              ])),
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Colors.red,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: const Icon(
                                                              CupertinoIcons
                                                                  .clear,
                                                              size: 12,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ])
                                                      ],
                                                    )
                                                  : Container(),
                                            ])),
*/ /*
                                        if (isBrandFound)
                                          _buildPartyContributionGauge(context),*/
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),

// Container arrondi blanc pour la liste des alternatives
/*
                                    (isProductFromUSA)
                                        ? Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.green.shade50,
                                                  Colors.blue.shade50,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ), // Ajout d'un dégradé
                                              border: Border.all(
                                                color: Colors.green.shade200,
                                                width: 1.5,
                                              ), // Bordure colorée
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 16),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    S
                                                        .of(context)
                                                        .alternativesLabel,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                (_alternatives.isNotEmpty)
                                                    ? SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            for (var i = 0;
                                                                i <
                                                                    _alternatives
                                                                        .length;
                                                                i += 2) ...[
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children:
                                                                    _alternatives
                                                                        .skip(i)
                                                                        .take(2)
                                                                        .map((alt) =>
                                                                            Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                                                              child: Container(
                                                                                width: 100,
                                                                                padding: const EdgeInsets.all(8),
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.grey.shade50,
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  border: Border.all(color: Colors.grey.shade200),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    alt,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: const TextStyle(fontSize: 14),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ))
                                                                        .toList(),
                                                              ),
                                                              const SizedBox(
                                                                  width:
                                                                      12), // Espace entre les colonnes
                                                            ],
                                                            const SizedBox(
                                                                height: 8),
                                                          ],
                                                        ),
                                                      )
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 8),
                                                        child: Text(
                                                          S
                                                              .of(context)
                                                              .noAlternativesYet,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 16,
                                                  ),
                                                  /*padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                color:
                                                    CupertinoColors.systemGrey6,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color:
                                                      CupertinoColors.separator,
                                                  width: 0.5,
                                                ),
                                              ),*/
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            CupertinoTextField(
                                                          controller:
                                                              _newAlternativeController,
                                                          placeholder: S
                                                              .of(context)
                                                              .proposeAlternativeHint,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 8),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                CupertinoColors
                                                                    .white,
                                                            border: Border.all(
                                                                color: CupertinoColors
                                                                    .systemGrey4,
                                                                width: 0.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      CupertinoButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        child: const Icon(
                                                          CupertinoIcons
                                                              .add_circled_solid,
                                                          color: CupertinoColors
                                                              .activeGreen,
                                                          size: 28,
                                                        ),
                                                        onPressed: () async {
                                                          final alt =
                                                              _newAlternativeController
                                                                  .text
                                                                  .trim();
                                                          if (alt.isEmpty) {
                                                            return;
                                                          }

                                                          // Préparer les données
                                                          final normalizedBrand =
                                                              normalizeBrandName(
                                                                  brand);
                                                          final data = {
                                                            'barcode': barcode,
                                                            'brand': brand,
                                                            'normalizedName':
                                                                normalizedBrand,
                                                            'alternative': alt,
                                                            'timestamp': FieldValue
                                                                .serverTimestamp(),
                                                          };

                                                          // Envoyer dans Firestore
                                                          try {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'brand_alternatives') // ou le nom de votre collection
                                                                .add(data);

                                                            // Mettre à jour localement l’affichage
                                                            setState(() {
                                                              _newAlternativeController
                                                                  .clear();
                                                            });

                                                            _incrementContributionScore(
                                                                5); // Incrémenter le score de contribution

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                  content: Text(S
                                                                      .of(context)
                                                                      .alternativeSubmittedMessage)),
                                                            );
                                                          } catch (e) {
                                                            // Gérer l’erreur si besoin
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  content: Text(
                                                                      '${S.of(context).alternativeSubmitErrorMessage} $e')),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ))
                                        : Container(),
                                        */
                                    if (isProductFromUSA &&
                                        _alternativeProducts.isNotEmpty)
                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(top: 12),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 16),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                S.of(context).alternativesLabel,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            SizedBox(
                                              height: 180,
                                              child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12),
                                                itemCount:
                                                    _alternativeProducts.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 12),
                                                itemBuilder: (context, index) {
                                                  final alt =
                                                      _alternativeProducts[
                                                          index];
                                                  return InkWell(
                                                    onTap: () {
                                                      // Optionnel: lancer un scan / afficher détails
                                                      // onBarcodeDetected(alt.code);
                                                    },
                                                    child: Container(
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey.shade200),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.05),
                                                            blurRadius: 4,
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(12),
                                                              topRight: Radius
                                                                  .circular(12),
                                                            ),
                                                            child: (alt.imageUrl
                                                                    .isNotEmpty)
                                                                ? Image.network(
                                                                    alt.imageUrl,
                                                                    height: 90,
                                                                    width: 140,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (_, __, ___) => Container(
                                                                        height:
                                                                            90,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade200,
                                                                        child: const Icon(
                                                                            Icons.image_not_supported)),
                                                                  )
                                                                : Container(
                                                                    height: 90,
                                                                    width: 140,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade200,
                                                                    child: const Icon(
                                                                        Icons
                                                                            .image,
                                                                        color: Colors
                                                                            .grey),
                                                                  ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  alt.name.isNotEmpty
                                                                      ? alt.name
                                                                      : (alt.brand
                                                                              .isNotEmpty
                                                                          ? alt
                                                                              .brand
                                                                          : S
                                                                              .of(context)
                                                                              .fallbackProduct),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                const SizedBox(
                                                                    height: 4),
                                                                Text(
                                                                  alt.brand,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade600),
                                                                ),
                                                                const SizedBox(
                                                                    height: 6),
                                                                /*Row(
                                                                  children: [
                                                                    Container(
                                                                      width: 10,
                                                                      height:
                                                                          10,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            badgeColor,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            6),
                                                                    Text(
                                                                      alt.isAmerican
                                                                          ? "US"
                                                                          : "SAFE",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              badgeColor,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                  ],
                                                                ),*/
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      Container(
                                          /*margin: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          S.of(context).noAlternativesYet,
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),*/
                                          ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: 16, left: 16),
                                      color: Colors.grey.shade200,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 16),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              S.of(context).optionsTitle,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Column(
                                            children: [
                                              // Container avec coins arrondis et ombre
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .white, // Couleur de fond
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12), // Coins arrondis
                                                ),
                                                child: Column(
                                                  children: [
                                                    // Première rangée cliquable
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => AddProductInfoScreen(
                                                                barcode:
                                                                    barcode,
                                                                initialBrand:
                                                                    (isBrandFound)
                                                                        ? brand
                                                                        : "",
                                                                initialDescription:
                                                                    (isBrandFound)
                                                                        ? description
                                                                        : "",
                                                                initialOrigin:
                                                                    (isBrandFound)
                                                                        ? origin
                                                                        : "",
                                                                initialParentCompany:
                                                                    (isBrandFound)
                                                                        ? parentCompany
                                                                        : "",
                                                                initialparentOrigin:
                                                                    (isBrandFound)
                                                                        ? parentOrigin
                                                                        : ""),
                                                          ),
                                                        ).then((_) async {
                                                          final prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          setState(() {
                                                            _contributionScore =
                                                                prefs.getInt(
                                                                        'contributionScore') ??
                                                                    0;
                                                          });
                                                        });
                                                      },
                                                      // Pas de borderRadius ici car c'est un élément du milieu
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 16.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .addProductInfoTitle, // Nouveau titre
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 16),
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .add_circle_outline, // Icône pour ajouter
                                                              color: Colors
                                                                  .blueAccent, // Couleur différente
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const Divider(
                                                        indent: 16,
                                                        endIndent: 0,
                                                        thickness: 0.5,
                                                        height: 1),
                                                    InkWell(
                                                      // Utilisation d'InkWell pour l'effet de clic
                                                      onTap: () {
                                                        // Naviguer vers la nouvelle page ReportProblemScreen
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ReportProblemScreen(
                                                              barcode:
                                                                  barcode, // Passer le code-barres actuel
                                                              brand:
                                                                  brand, // Passer la marque actuelle
                                                            ),
                                                          ),
                                                        ).then((_) async {
                                                          final prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          setState(() {
                                                            _contributionScore =
                                                                prefs.getInt(
                                                                        'contributionScore') ??
                                                                    0;
                                                          });
                                                        });
                                                      },
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(12),
                                                              topRight: Radius
                                                                  .circular(
                                                                      12)), // Arrondi correspondant au Container
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 16.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .reportProblemActionTitle,
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 16),
                                                            ),
                                                            const Icon(
                                                              CupertinoIcons
                                                                  .exclamationmark_bubble, // Icône plus pertinente
                                                              color: Colors
                                                                  .redAccent, // Couleur de l'icône
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const Divider(
                                                        indent: 16,
                                                        endIndent: 0,
                                                        thickness: 0.5,
                                                        height:
                                                            1), // Séparateur avec retrait et hauteur réduite
                                                    // Deuxième rangée cliquable
                                                    InkWell(
                                                      // Utilisation d'InkWell pour l'effet de clic
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const CriteriaScreen(),
                                                          ),
                                                        );
                                                      },
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              bottomLeft: Radius
                                                                  .circular(12),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      12)), // Arrondi correspondant au Container
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 16.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                S
                                                                    .of(context)
                                                                    .classificationInfoTitle,
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .info_outline, // Icône plus pertinente
                                                              color: Colors
                                                                  .grey, // Couleur de l'icône
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 32,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ])),
                            ));
                      },
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ...existing code...

class ProductHealthInfo {
  final String? productName;
  final String? brand;
  final String? imageUrl;

  // Scores/qualifs
  final String? nutriScoreGrade; // a, b, c, d, e
  final int? novaGroup; // 1..4
  final List<String> additives; // tags d’additifs
  final List<String> allergens; // tags d’allergènes
  final bool? isOrganic; // Indique si le produit est bio (true/false)

  // Nutriments (pour 100g si dispo)
  final double? energyKcal100g;
  final double? sugars100g;
  final double? salt100g;
  final double? fat100g;
  final double? saturatedFat100g;
  final double? proteins100g;
  final double? fiber100g;
  final double? carbohydrates100g;

  const ProductHealthInfo({
    this.productName,
    this.brand,
    this.imageUrl,
    this.nutriScoreGrade,
    this.novaGroup,
    this.additives = const [],
    this.allergens = const [],
    this.energyKcal100g,
    this.sugars100g,
    this.salt100g,
    this.fat100g,
    this.saturatedFat100g,
    this.proteins100g,
    this.fiber100g,
    this.carbohydrates100g,
    this.isOrganic,
  });

  // --- Ajouts: échelle + descriptions ---

  // Échelle générique basse / moyenne / élevée
  static NutrientLevel _classify(double? v,
      {required double lowMax, required double highMin}) {
    if (v == null) return NutrientLevel.unknown;
    if (v <= lowMax) return NutrientLevel.low;
    if (v >= highMin) return NutrientLevel.high;
    return NutrientLevel.medium;
  }

  // Mapping niveau -> couleur (pour badge)
  static Color levelColor(NutrientLevel level, {required String nutrientType}) {
    // Pour les nutriments où "plus c'est mieux" (ex : protéines, fibres)
    final positiveNutrients = [S.current.proteinsTitle, S.current.fiberTitle];

    if (positiveNutrients.contains(nutrientType)) {
      switch (level) {
        case NutrientLevel.low:
          return Colors.red; // Faible quantité = rouge
        case NutrientLevel.medium:
          return Colors.orange; // Quantité modérée = orange
        case NutrientLevel.high:
          return Colors.green; // Bonne quantité = vert
        case NutrientLevel.unknown:
          return Colors.grey; // Inconnu = gris
      }
    } else {
      // Pour les nutriments où "moins c'est mieux" (ex : sucre, sel, graisses)
      switch (level) {
        case NutrientLevel.low:
          return Colors.green; // Faible quantité = vert
        case NutrientLevel.medium:
          return Colors.orange; // Quantité modérée = orange
        case NutrientLevel.high:
          return Colors.red; // Trop élevé = rouge
        case NutrientLevel.unknown:
          return Colors.grey; // Inconnu = gris
      }
    }
  }

  // Format valeur courte
  static String _g(double? v) {
    if (v == null) return S.current.naLabel;
    final valueStr = v.toStringAsFixed(v >= 10 ? 0 : 1);
    return S.current.gramsValue(valueStr);
  }

  static String _kcal(double? v) {
    if (v == null) return S.current.naLabel;
    final valueStr = v.toStringAsFixed(0);
    return S.current.kcalValue(valueStr);
  }

  // Descriptions (inspirées des repères UK pour 100 g)
  // Sucre: low ≤ 5 g, high ≥ 22.5 g
  NutrientAssessment sugarAssessment() {
    final level = _classify(sugars100g, lowMax: 5.0, highMin: 22.5);
    final desc = switch (level) {
      NutrientLevel.low => S.current.sugarsLow,
      NutrientLevel.medium => S.current.sugarsMedium,
      NutrientLevel.high => S.current.sugarsHigh,
      _ => S.current.unknownData,
    };
    return NutrientAssessment(
      title: S.current.sugarsTitle,
      additionalValue: _g(sugars100g),
      description: desc,
      level: level,
      icon: CupertinoIcons.cube_box_fill,
      // Défaut si élevé
      isDefaut: level == NutrientLevel.high,
    );
  }

  // Sel: low ≤ 0.3 g, high ≥ 1.5 g
  NutrientAssessment saltAssessment() {
    final level = _classify(salt100g, lowMax: 0.3, highMin: 1.5);
    final desc = switch (level) {
      NutrientLevel.low => S.current.saltLow,
      NutrientLevel.medium => S.current.saltMedium,
      NutrientLevel.high => S.current.saltHigh,
      _ => S.current.unknownData,
    };
    return NutrientAssessment(
      title: S.current.saltTitle,
      additionalValue: _g(salt100g),
      description: desc,
      level: level,
      icon: CupertinoIcons.drop,
      isDefaut: level == NutrientLevel.high,
    );
  }

  // Graisses totales: low ≤ 3 g, high ≥ 17.5 g
  NutrientAssessment fatAssessment() {
    final level = _classify(fat100g, lowMax: 3.0, highMin: 17.5);
    final desc = switch (level) {
      NutrientLevel.low => S.current.fatLow,
      NutrientLevel.medium => S.current.fatMedium,
      NutrientLevel.high => S.current.fatHigh,
      _ => S.current.unknownData,
    };
    return NutrientAssessment(
      title: S.current.fatTitle,
      additionalValue: _g(fat100g),
      description: desc,
      level: level,
      icon: CupertinoIcons.drop_fill,
      isDefaut: level == NutrientLevel.high,
    );
  }

  // Graisses saturées: low ≤ 1.5 g, high ≥ 5 g
  NutrientAssessment saturatedFatAssessment() {
    final level = _classify(saturatedFat100g, lowMax: 1.5, highMin: 5.0);
    final desc = switch (level) {
      NutrientLevel.low => S.current.saturatedFatLow,
      NutrientLevel.medium => S.current.saturatedFatMedium,
      NutrientLevel.high => S.current.saturatedFatHigh,
      _ => S.current.unknownData,
    };
    return NutrientAssessment(
      title: S.current.saturatedFatTitle,
      additionalValue: _g(saturatedFat100g),
      description: desc,
      level: level,
      icon: CupertinoIcons.drop_triangle_fill,
      isDefaut: level == NutrientLevel.high,
    );
  }

  // Fibres (repères génériques): low < 3 g, high > 6 g
  NutrientAssessment fiberAssessment() {
    // Si non présent dans OFF pour ce produit, restera inconnu
    final level = _classify(fiber100g, lowMax: 3.0, highMin: 6.0);
    final desc = switch (level) {
      NutrientLevel.low => S.current.fiberLow,
      NutrientLevel.medium => S.current.fiberMedium,
      NutrientLevel.high => S.current.fiberHigh,
      _ => S.current.unknownData,
    };
    return NutrientAssessment(
      title: S.current.fiberTitle,
      additionalValue: _g(fiber100g),
      description: desc,
      level: level,
      icon: CupertinoIcons.leaf_arrow_circlepath,
      // Pour les fibres: défaut si faible (sinon qualité)
      isDefaut: level == NutrientLevel.low,
    );
  }

  // Protéines (repères génériques): low < 3 g, high > 8 g
  NutrientAssessment proteinAssessment() {
    final level = _classify(proteins100g, lowMax: 3.0, highMin: 8.0);
    final desc = switch (level) {
      NutrientLevel.low => S.current.proteinsLow,
      NutrientLevel.medium => S.current.proteinsMedium,
      NutrientLevel.high => S.current.proteinsHigh,
      _ => S.current.unknownData,
    };
    return NutrientAssessment(
      title: S.current.proteinsTitle,
      additionalValue: _g(proteins100g),
      description: desc,
      level: level,
      icon: CupertinoIcons.heart_fill,
      isDefaut: level == NutrientLevel.low,
    );
  }

  // Énergie (kcal): low < 150, high > 400 (pour 100 g)
  NutrientAssessment energyAssessment() {
    final level = _classify(energyKcal100g, lowMax: 150.0, highMin: 400.0);
    final desc = switch (level) {
      NutrientLevel.low => S.current.energyLow,
      NutrientLevel.medium => S.current.energyMedium,
      NutrientLevel.high => S.current.energyHigh,
      _ => S.current.unknownData,
    };
    return NutrientAssessment(
      title: S.current.energyTitle,
      additionalValue: _kcal(energyKcal100g),
      description: desc,
      level: level,
      icon: CupertinoIcons.flame,
      isDefaut: level == NutrientLevel.high,
    );
  }

  List<Map<String, dynamic>> toNutritionInfos() {
    final items = <NutrientAssessment>[
      energyAssessment(),
      sugarAssessment(),
      saltAssessment(),
      fatAssessment(),
      saturatedFatAssessment(),
      fiberAssessment(),
      proteinAssessment(),
    ];

    final List<Map<String, Object>> nutritionInfos = items
        .where((a) =>
            a.level != NutrientLevel.unknown) // Filtre les éléments inconnus
        .map((a) {
      return {
        "show": true,
        "isDefaut": a.isDefaut,
        "icon": a.icon,
        "title": a.title,
        "additionalValue": a.additionalValue,
        "value": a.description,
        "badgeColor": levelColor(a.level, nutrientType: a.title),
      };
    }).toList();

    // Ajout des informations supplémentaires

    if (novaGroup != null) {
      String novaDescription;
      switch (novaGroup) {
        case 1:
          novaDescription = S.current.novaGroup1Desc;
          break;
        case 2:
          novaDescription = S.current.novaGroup2Desc;
          break;
        case 3:
          novaDescription = S.current.novaGroup3Desc;
          break;
        case 4:
          novaDescription = S.current.novaGroup4Desc;
          break;
        default:
          novaDescription = S.current.novaGroupUnknown;
      }

      nutritionInfos.insert(0, {
        "show": true,
        "isDefaut": novaGroup! >= 3,
        "icon": CupertinoIcons.circle_grid_3x3_fill,
        "title": S.current.novaGroupTitle,
        "additionalValue": S.current.novaGroupAdditional(novaGroup!.toString()),
        "value": novaDescription,
        "badgeColor": novaGroup! >= 3 ? Colors.red : Colors.green,
      });
    }

    if (isOrganic != null) {
      nutritionInfos.insert(0, {
        "show": true,
        "isDefaut": !isOrganic!,
        "icon": CupertinoIcons.leaf_arrow_circlepath,
        "title": S.current.organicTitle,
        "additionalValue": "",
        "value": isOrganic! ? S.current.organicYes : S.current.organicNo,
        "badgeColor": isOrganic! ? Colors.green : Colors.grey,
      });
    }

    if (additives.isNotEmpty) {
      nutritionInfos.add({
        "show": true,
        "isDefaut": true,
        "icon": CupertinoIcons.lab_flask,
        "title": S.current.additivesTitle,
        "additionalValue": "",
        "value": additives.join(", "),
        "badgeColor": Colors.orange,
      });
    }

    if (allergens.isNotEmpty) {
      nutritionInfos.add({
        "show": true,
        "isDefaut": true,
        "icon": CupertinoIcons.exclamationmark_triangle_fill,
        "title": S.current.allergensTitle,
        "additionalValue": "",
        "value": allergens.join(", "),
        "badgeColor": Colors.orange,
      });
    }

    return nutritionInfos;
  }

  factory ProductHealthInfo.fromProduct(Product p) {
    double? toDouble(num? v) => v == null ? null : v.toDouble();
    final n = p.nutriments?.toJson();

    final isOrganic = (p.labelsTags ?? []).any((tag) =>
        tag.toLowerCase().contains("organic") ||
        tag.toLowerCase().contains("bio"));

    return ProductHealthInfo(
      productName: p.productName,
      brand: p.brands,
      imageUrl: p.imageFrontUrl,
      nutriScoreGrade: p.nutriscore, // lettre: a..e
      novaGroup: p.novaGroup, // 1..4
      additives: (p.additives?.names ?? const []).cast<String>(),
      allergens: (p.allergens?.names ?? const []).cast<String>(),
      energyKcal100g: toDouble(n?['energy-kcal_100g']),
      sugars100g: toDouble(n?['sugars_100g']),
      salt100g: toDouble(n?['salt_100g']),
      fat100g: toDouble(n?['fat_100g']),
      saturatedFat100g: toDouble(n?['saturated-fat_100g']),
      proteins100g: toDouble(n?['proteins_100g']),
      fiber100g: toDouble(n?['fiber_100g']),
      carbohydrates100g: toDouble(n?['carbohydrates_100g']),
      isOrganic: isOrganic,
    );
  }
}

// Petit type d'aide
enum NutrientLevel { low, medium, high, unknown }

class NutrientAssessment {
  final String title;
  final String additionalValue; // ex: "5 g" / "150 kcal"
  final String description; // ex: "Trop sucré"
  final NutrientLevel level;
  final IconData icon;
  final bool isDefaut;

  NutrientAssessment({
    required this.title,
    required this.additionalValue,
    required this.description,
    required this.level,
    required this.icon,
    required this.isDefaut,
  });
}

class AlternativeProduct {
  final String code;
  final String name;
  final String brand;
  final String imageUrl;
  final bool isAmerican;

  AlternativeProduct({
    required this.code,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.isAmerican,
  });
}
