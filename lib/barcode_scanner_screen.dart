import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:detrumpezvous/add_product.dart';
import 'package:detrumpezvous/add_product_info_screen.dart';
import 'package:detrumpezvous/criteria_screen.dart';
import 'package:detrumpezvous/edit_contribution_screen.dart';
import 'package:detrumpezvous/report_problem_screen.dart';
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
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:logger/logger.dart';
import 'package:translator/translator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

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
  bool isIngredientsOriginFromUS = false; // pour savoir si l'origine est US

  bool _isBottomSheetOpen = false; // Empêche l’ouverture en double
  bool _isSheetExpanded = false;

  int _contributionScore = 0; // Score de contribution

  int _democratContribution = 0;
  int _republicanContribution = 0;

  // Ajoutez ce contrôleur dans votre state:
  final TextEditingController manualSearchController = TextEditingController();

  final InAppReview inAppReview = InAppReview.instance;
  int _safeScanCount = 0; // Compteur en mémoire
  int _usaScanCount = 0; // Nouveau compteur pour les produits USA
  bool _reviewHasBeenRequested =
      false; // Pour ne demander qu'une fois par session/période
  bool _isTrumpShowed = true;
  bool _isUSACountShowed = true;

  bool _considerAsAmerican = false;
  bool _isFlashOn = false; // Par défaut, le flash est désactivé

  // Contrôleur pour l'animation de tremblement
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

  List<String> _alternatives = [];

  final TextEditingController _newAlternativeController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    loadBrands();
    _loadCounters();

    // Initialiser le contrôleur de tremblement
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400), // Durée du tremblement
      vsync: this, // Nécessite TickerProviderStateMixin
    );

    // Initialiser le contrôleur de tremblement pour la barre de recherche
    _searchShakeController = AnimationController(
      duration: const Duration(milliseconds: 500), // Durée de l'animation
      vsync: this, // Nécessite TickerProviderStateMixin
    );
  }

  @override
  void dispose() {
    _newAlternativeController.dispose();
    manualSearchController.dispose();
    _shakeController
        .dispose(); // Ne pas oublier de disposer le nouveau contrôleur
    _searchShakeController.dispose();
    super.dispose();
  }

  Future<void> _incrementContributionScore(int points) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _contributionScore += points; // Ajoute les points au score actuel
    });
    await prefs.setInt(
        'contributionScore', _contributionScore); // Sauvegarde le score
  }

  // Charger les compteurs depuis SharedPreferences
  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isTrumpShowed =
          prefs.getBool('isTrumpShowed') ?? true; // Charger l'état de Trump
      _isUSACountShowed = prefs.getBool('isUSACountShowed') ??
          true; // Charger l'état du compteur USA
      _safeScanCount = prefs.getInt('safeScanCount') ?? 0;
      _usaScanCount =
          prefs.getInt('usaScanCount') ?? 0; // Charger le compteur USA
      _reviewHasBeenRequested = prefs.getBool('reviewRequested') ?? false;
      _considerAsAmerican = prefs.getBool('considerAsAmerican') ?? false;
      _contributionScore = prefs.getInt('contributionScore') ?? 0;
    });
  }

  // Incrémenter le compteur Safe et le sauvegarder
  Future<void> _incrementSafeScanCount() async {
    final prefs = await SharedPreferences.getInstance();
    _safeScanCount++;
    await prefs.setInt('safeScanCount', _safeScanCount);
    setState(() {});
  }

  // Incrémenter le compteur USA et le sauvegarder
  Future<void> _incrementUsaScanCount() async {
    final prefs = await SharedPreferences.getInstance();
    _usaScanCount++;
    await prefs.setInt(
        'usaScanCount', _usaScanCount); // Sauvegarder le compteur USA
    setState(() {});

    // Déclencher l'animation de tremblement
    _shakeController.forward(from: 0.0);
  }

  // Marquer que la demande a été faite
  Future<void> _markReviewRequested() async {
    final prefs = await SharedPreferences.getInstance();
    _reviewHasBeenRequested = true;
    await prefs.setBool('reviewRequested', true);
    setState(() {});
  }

  // Fonction pour déclencher la demande d'avis (à appeler au bon moment)
  Future<void> _requestReview() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
      await _markReviewRequested(); // Marquer comme demandé après l'appel
    }
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
  bool checkOrigin(String origin) {
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
    List<String?>? foodFactData = await fetchFromOpenFoodFact(barcode);
    String? productData = foodFactData?[0];
    String? origin = foodFactData?[1];

    productData ??= await fetchFromOpenBeautyFact(barcode);

    productData ??= await fetchFromOpenPetFoodFacts(barcode);

    productData ??= await fetchFromOpenProductFact(barcode);

    await updateProductInfoDetails(productData, origin ?? "");
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

  /// Exemple de fonction pour interroger l'API OpenBeautyFact.
  Future<String?> fetchFromOpenBeautyFact(String barcode) async {
    final String url =
        'https://world.openbeautyfacts.org/api/v2/product/$barcode.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["product"] != null && data["product"]["brands"] != null) {
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
        ProductField.BRANDS,
        ProductField.COUNTRIES,
        ProductField.ALL
      ],
    );
    final ProductResultV3 resultFood =
        await OpenFoodAPIClient.getProductV3(config);

    if (resultFood.product != null && resultFood.product?.brands != null) {
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

  Future<void> updateProductInfoDetails(
      String? productData, String ingredientsOrigin) async {
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
      isIngredientsOriginFromUS = checkOrigin(ingredientsOrigin);

      _democratContribution = resultJson["democratContribution"] ?? 0;
      _republicanContribution = resultJson["republicanContribution"] ?? 0;

      if (resultJson["alternatives"] != null) {
        _alternatives = (resultJson["alternatives"] as List<dynamic>)
            .map((item) => item.toString())
            .toList();
      } else {
        _alternatives = [];
      }

      if (_considerAsAmerican &&
          (origin == "US" || isIngredientsOriginFromUS)) {
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
      if (!_isBottomSheetOpen) {
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

  // Fonction helper pour obtenir le widget du drapeau
  Widget _getFlagWidget(String countryCode) {
    if (countryCode != "") {
      try {
        // Utilise le package country_flags pour afficher le drapeau
        return CountryFlag.fromCountryCode(
          countryCode,
          height: 40,
          width: 50, // Ajustez la largeur si nécessaire pour le ratio
        );
      } catch (e) {
        // Si le code pays n'est pas valide pour le package
        logger.w(
            "Code pays '$countryCode' invalide pour le package country_flags: $e");
        return const Icon(Icons.business, size: 40, color: Colors.grey);
      }
    } else {
      // Si la valeur d'origine n'est pas dans notre map de conversion
      logger.w("Code pays non trouvé dans la map pour: '$countryCode'");
      return const Icon(Icons.business, size: 40, color: Colors.grey);
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

  @override
  Widget build(BuildContext context) {
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
                                        (_isUSACountShowed)
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
                                          (_isUSACountShowed)
                                              ? " x $_usaScanCount"
                                              : " x $_safeScanCount",
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
                                    const Text(
                                      "Compteur USA",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Switch(
                                      value: _isUSACountShowed,
                                      onChanged: (bool value) async {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        setState(() {
                                          _isUSACountShowed = value;
                                        });
                                        await prefs.setBool(
                                            'isUSACountShowed', value);

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
                                      const SnackBar(
                                        content: Text(
                                            "Scores réinitialisés avec succès."),
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
                                  child: const Text(
                                    "Réinitialiser",
                                    style: TextStyle(color: Colors.white),
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
                    final double dx = sin(_shakeController.value * pi * 4) *
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
                        (_isUSACountShowed)
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
                        const Text("x"),
                        const SizedBox(width: 4),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: Text(
                            (_isUSACountShowed)
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
                      color: !isBrandFound
                          ? Colors.grey.shade100
                          : (!isProductFromUSA
                              ? Colors.green.shade100
                              : Colors.red.shade100),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.only(right: 16, left: 16),
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
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        // Champ de recherche manuelle
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 8),
                                            child: AnimatedBuilder(
                                              animation: _searchShakeController,
                                              builder: (context, child) {
                                                // Calculer le décalage horizontal basé sur l'animation
                                                final double dx = sin(
                                                        _searchShakeController
                                                                .value *
                                                            pi *
                                                            6) *
                                                    8;
                                                return Transform.translate(
                                                  offset: Offset(dx,
                                                      0), // Appliquer le décalage horizontal
                                                  child:
                                                      child, // Le champ de recherche
                                                );
                                              },
                                              child: CupertinoSearchTextField(
                                                controller:
                                                    manualSearchController,
                                                placeholder: S
                                                    .of(context)
                                                    .manualSearchPlaceholder,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                                backgroundColor:
                                                    Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                onSubmitted: (value) async {
                                                  final String brand =
                                                      value.trim();
                                                  if (brand.isNotEmpty) {
                                                    setState(() {
                                                      manualSearchUsed = true;
                                                    });
                                                    await updateProductInfoDetails(
                                                        brand, "");
                                                  }
                                                },
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (!isBrandFound && manualSearchUsed)
                                          Text(
                                            S.of(context).searchWarning,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.red),
                                          ),
                                        const SizedBox(height: 8),
                                        // Autres widgets d'affichage produit...

                                        Row(
                                          children: [
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
                                                        shape: BoxShape.circle,
                                                        color: Colors.grey,
                                                      )
                                                    : (!isProductFromUSA
                                                        ? const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.green,
                                                          )
                                                        : BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image:
                                                                DecorationImage(
                                                              image: (_isTrumpShowed)
                                                                  ? const AssetImage(
                                                                      "assets/trump.jpg")
                                                                  : const AssetImage(
                                                                      "assets/usa.png"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )),
                                                child: !isBrandFound
                                                    ? const Icon(
                                                        Icons.question_mark,
                                                        size: 80,
                                                        color: Colors.white,
                                                      )
                                                    : (!isProductFromUSA
                                                        ? const Icon(
                                                            Icons.check,
                                                            size: 80,
                                                            color: Colors.white,
                                                          )
                                                        : Container()),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                "Informations"),
                                                            content: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                    description,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          8),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        "($source)",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color:
                                                                                Colors.blue),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ]),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context); // Fermer la popup
                                                                },
                                                                child: const Text(
                                                                    "Fermer"),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          brand,
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Icon(
                                                          Icons.info_outline,
                                                          color: Colors.blue,
                                                          size: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                      !isBrandFound
                                                          ? S
                                                              .of(context)
                                                              .unknownProductMessage
                                                          : (!isProductFromUSA
                                                              ? S
                                                                  .of(context)
                                                                  .safeProductMessage
                                                              : S
                                                                  .of(context)
                                                                  .usaProductMessage),
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: !isBrandFound
                                                            ? Colors.grey
                                                            : (!isProductFromUSA
                                                                ? Colors.green
                                                                : Colors.red),
                                                      )),
                                                  const SizedBox(height: 8),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: !isBrandFound
                                                              ? Colors.grey
                                                              : (!isProductFromUSA
                                                                  ? Colors.green
                                                                  : Colors.red),
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Text(
                                                      !isBrandFound
                                                          ? S
                                                              .of(context)
                                                              .unknown
                                                          : (!isProductFromUSA
                                                              ? S
                                                                  .of(context)
                                                                  .safe
                                                              : S
                                                                  .of(context)
                                                                  .usa),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: !isBrandFound
                                                            ? Colors.grey
                                                            : (!isProductFromUSA
                                                                ? Colors.green
                                                                : Colors.red),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
                                                                const Text(
                                                                    "USA",
                                                                    style: TextStyle(
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

                                        if (isBrandFound)
                                          _buildPartyContributionGauge(context),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),

// Container arrondi blanc pour la liste des alternatives
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
                                    const SizedBox(height: 40),
                                    Column(
                                      children: [
                                        // Container avec coins arrondis et ombre
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white, // Couleur de fond
                                            borderRadius: BorderRadius.circular(
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
                                                          barcode: barcode,
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 12.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .add_circle_outline, // Icône pour ajouter
                                                        color: Colors
                                                            .blueAccent, // Couleur différente
                                                      ),
                                                      const SizedBox(
                                                          width: 16), // Espace
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .addProductInfoTitle, // Nouveau titre
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16),
                                                            ),
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .addInfoSubtitle, // Nouveau sous-titre
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      600],
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Icon(
                                                          CupertinoIcons
                                                              .chevron_right,
                                                          color: Colors.grey[
                                                              400]), // Chevron
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Divider(
                                                  indent: 16,
                                                  endIndent: 16,
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
                                                borderRadius: const BorderRadius
                                                    .only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight: Radius.circular(
                                                        12)), // Arrondi correspondant au Container
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 12.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .report_problem_outlined, // Icône plus pertinente
                                                        color: Colors
                                                            .redAccent, // Couleur de l'icône
                                                      ),
                                                      const SizedBox(
                                                          width:
                                                              16), // Espace entre icône et texte
                                                      Expanded(
                                                        // Pour que la colonne prenne l'espace restant
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start, // Aligner le texte à gauche
                                                          children: [
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .reportProblemActionTitle, // Utiliser la nouvelle clé
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16),
                                                            ),
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .reportProblemActionSubtitle, // Utiliser la nouvelle clé
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      600],
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Icon(
                                                          CupertinoIcons
                                                              .chevron_right,
                                                          color: Colors.grey[
                                                              400]), // Chevron plus discret
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Divider(
                                                  indent: 16,
                                                  endIndent: 16,
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
                                                  ).then((value) async {
                                                    // Recharger la page après le retour
                                                    final prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    setState(() {
                                                      _considerAsAmerican =
                                                          prefs.getBool(
                                                                  'considerAsAmerican') ??
                                                              false;
                                                    });
                                                  });
                                                },
                                                borderRadius: const BorderRadius
                                                    .only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight: Radius.circular(
                                                        12)), // Arrondi correspondant au Container
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 12.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .info_outline, // Icône plus pertinente
                                                        color: Colors
                                                            .grey, // Couleur de l'icône
                                                      ),
                                                      const SizedBox(
                                                          width:
                                                              16), // Espace entre icône et texte
                                                      Expanded(
                                                        // Pour que la colonne prenne l'espace restant
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start, // Aligner le texte à gauche
                                                          children: [
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .classificationInfoTitle, // Utiliser la nouvelle clé
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16),
                                                            ),
                                                            Text(
                                                              S
                                                                  .of(context)
                                                                  .classificationInfoSubtitle, // Utiliser la nouvelle clé
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .grey[
                                                                      600],
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Icon(
                                                          CupertinoIcons
                                                              .chevron_right,
                                                          color: Colors.grey[
                                                              400]), // Chevron plus discret
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
