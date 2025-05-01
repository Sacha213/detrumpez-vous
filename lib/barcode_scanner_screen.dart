import 'dart:convert';
import 'dart:io';
import 'package:detrumpezvous/add_product.dart';
import 'package:detrumpezvous/add_product_info_screen.dart';
import 'package:detrumpezvous/criteria_screen.dart';
import 'package:detrumpezvous/report_problem_screen.dart';
import 'package:http/http.dart' as http;
import 'package:detrumpezvous/corner_painter.dart';
import 'package:detrumpezvous/generated/l10n.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:logger/logger.dart';
import 'package:translator/translator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  String source = S.current.sourceNotFound;
  bool isProductFromUSA = false;
  bool manualSearchUsed = false;
  List<dynamic> brandlist = [];
  bool isProcessing = false; // pour éviter plusieurs scans simultanés
  bool isBrandFound = false; // pour savoir si le produit est dans une liste

  // Ajoutez ce contrôleur dans votre state:
  final TextEditingController manualSearchController = TextEditingController();

  final InAppReview inAppReview = InAppReview.instance;
  int _safeScanCount = 0; // Compteur en mémoire
  int _usaScanCount = 0; // Nouveau compteur pour les produits USA
  bool _reviewHasBeenRequested =
      false; // Pour ne demander qu'une fois par session/période
  bool _isTrumpShowed = true;

  // Contrôleur pour l'animation de tremblement
  late AnimationController _shakeController;

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
  }

  @override
  void dispose() {
    manualSearchController.dispose();
    _shakeController
        .dispose(); // Ne pas oublier de disposer le nouveau contrôleur
    super.dispose();
  }

  // Charger les compteurs depuis SharedPreferences
  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isTrumpShowed =
          prefs.getBool('isTrumpShowed') ?? true; // Charger l'état de Trump
      _safeScanCount = prefs.getInt('safeScanCount') ?? 0;
      _usaScanCount =
          prefs.getInt('usaScanCount') ?? 0; // Charger le compteur USA
      _reviewHasBeenRequested = prefs.getBool('reviewRequested') ?? false;
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
    //await fetchProductInfo("5000112611762");
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
          return found;
        }
      } catch (e) {
        // Au cas où on ne trouve rien pour ce candidat, on passe au suivant
        continue;
      }
    }

    // Si aucun des candidats ne correspond, on renvoie un Map vide
    return <String, dynamic>{};
  }

  /// Récupère les informations d'un produit depuis plusieurs API.
  Future<void> fetchProductInfo(String barcode) async {
    String? productData = await fetchFromOpenFoodFact(barcode);

    productData ??= await fetchFromOpenBeautyFact(barcode);

    productData ??= await fetchFromOpenPetFoodFacts(barcode);

    productData ??= await fetchFromOpenProductFact(barcode);

    await updateProductInfoDetails(productData);
  }

  /// Fonction pour normaliser un nom de marque
  String normalizeBrandName(String input) {
    return removeDiacritics(input.toLowerCase().replaceAll(
            RegExp(r'\band\b', caseSensitive: false),
            "")) // Supprimer les accents et "and"
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
  Future<String?> fetchFromOpenFoodFact(String barcode) async {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: "DeTrumpez-VousApp",
      version: "1.0.0",
      system: "Flutter",
    );

    final ProductQueryConfiguration config = ProductQueryConfiguration(
      barcode,
      version: ProductQueryVersion.v3,
      language: OpenFoodFactsLanguage.FRENCH,
      fields: [ProductField.NAME, ProductField.BRANDS, ProductField.COUNTRIES],
    );
    final ProductResultV3 resultFood =
        await OpenFoodAPIClient.getProductV3(config);

    if (resultFood.product != null && resultFood.product?.brands != null) {
      return resultFood.product?.brands;
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
      brand = (resultJson["name"]?.toString().isNotEmpty == true)
          ? resultJson["name"]
          : ((productData?.isNotEmpty == true)
              ? productData!
              : S.of(context).brandNotFound);
      description = desc ?? S.of(context).descriptionNotFound;
      source = resultJson["source"] ?? S.of(context).sourceNotFound;
      parentCompany = resultJson["parentCompany"] ?? S.of(context).unknown;
      company = resultJson["company"] ?? S.of(context).unknown;
      origin = resultJson["origin"] ?? "";
      parentOrigin =
          resultJson["parentOrigin"] ?? ""; // Stocker le pays d'origine
      isProductFromUSA = resultJson["parentOrigin"] == "US";
      isBrandFound = resultJson.isNotEmpty;
    });

    if (isBrandFound) {
      if (!isProductFromUSA) {
        // Produit "Safe" trouvé
        await _incrementSafeScanCount();
        _checkAndRequestReviewIfNeeded();
      } else {
        // Produit "USA" trouvé
        await _incrementUsaScanCount(); // Incrémente le compteur USA
      }
    }

    // Si la marque n'est pas trouvée dans les listes, l'envoyer sur Firebase
    if (!isBrandFound &&
        productData != null &&
        productData.isNotEmpty &&
        !manualSearchUsed) {
      await FirebaseFirestore.instance.collection('unknown_brands').add({
        'brand_name': productData,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    // Déclenche un retour haptique (vibration légère)
    if (isBrandFound) {
      HapticFeedback.mediumImpact();
    } else if (productData == null || productData.isEmpty) {
      // Utiliser WidgetsBinding pour s'assurer que le build est terminé
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (mounted) {
          // Stocker le code-barres actuel avant d'ouvrir la sheet
          final String currentBarcode = barcode;

          // Attend que la bottom sheet soit fermée
          await showModalBottomSheet(
            context: context,
            isScrollControlled:
                true, // Important pour que la sheet s'adapte au clavier
            backgroundColor:
                Colors.grey.shade100, // Couleur de fond de la sheet
            shape: const RoundedRectangleBorder(
              // Coins arrondis
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext sheetContext) {
              // Utiliser un contexte différent
              return AddProduct(
                  barcode: currentBarcode); // Passer le code-barres stocké
            },
          );

          // Après la fermeture de la sheet, vérifier à nouveau si monté et réinitialiser
          if (mounted) {
            setState(() {
              barcode = ""; // Réinitialise le code-barres
            });
          }
        }
      });
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
                  onDetect: (BarcodeCapture capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    if (barcodes.isNotEmpty && !isProcessing) {
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
                      child: const Text(
                        "Scannez un code barre",
                        style: TextStyle(
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

          // --- NOUVEAU WIDGET COMPTEUR ---
          Positioned(
              top: safeAreaPadding.top + 10,
              right: 15,
              // Enveloppe avec AnimatedBuilder pour le tremblement
              child: GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  setState(() {
                    _isTrumpShowed = !_isTrumpShowed;
                  });
                  await prefs.setBool('isTrumpShowed', !_isTrumpShowed);
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
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: (_isTrumpShowed)
                              ? const AssetImage("assets/trump.jpg")
                              : const AssetImage("assets/usa.png"),
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
                            "$_usaScanCount",
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
          DraggableScrollableSheet(
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
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
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
                                          child: CupertinoSearchTextField(
                                            controller: manualSearchController,
                                            placeholder: S
                                                .of(context)
                                                .manualSearchPlaceholder,
                                            style:
                                                const TextStyle(fontSize: 16),
                                            backgroundColor: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            onSubmitted: (value) async {
                                              final String brand = value.trim();
                                              if (brand.isNotEmpty) {
                                                setState(() {
                                                  manualSearchUsed = true;
                                                });
                                                await updateProductInfoDetails(
                                                    brand);
                                              }
                                            },
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                          ),
                                        ),
                                      ),
                                      if (!isBrandFound && manualSearchUsed)
                                        Text(
                                          S.of(context).searchWarning,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.red),
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
                                                    !_isTrumpShowed);
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
                                                Text(
                                                  brand,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
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
                                                      .symmetric(horizontal: 8),
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
                                                        ? S.of(context).unknown
                                                        : (!isProductFromUSA
                                                            ? S.of(context).safe
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
                                            borderRadius: BorderRadius.circular(
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
                                            Row(children: [
                                              // Vous pourriez ajouter une icône ici si pertinent
                                              (parentOrigin != "")
                                                  ? _getFlagWidget(parentOrigin)
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
                                                            .parentCompanyLabel,
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight
                                                                .bold)), // Style du titre
                                                    const SizedBox(
                                                        height:
                                                            2), // Espace entre titre et valeur
                                                    Text(parentCompany,
                                                        style: const TextStyle(
                                                            fontSize:
                                                                14)) // Style de la valeur
                                                  ]))
                                            ]),
                                            const SizedBox(height: 8),
                                            const Divider(
                                                indent: 16,
                                                endIndent: 16,
                                                height: 1),
                                            const SizedBox(height: 8),
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
                                                  ]))
                                            ])
                                          ])),
                                      const SizedBox(height: 16),
                                      Text(
                                        description,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),

                                      if (isProductFromUSA)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "($source)",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
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
                                                    builder: (context) =>
                                                        AddProductInfoScreen(
                                                            barcode: barcode,
                                                            initialBrand: brand,
                                                            initialDescription:
                                                                description,
                                                            initialOrigin:
                                                                origin,
                                                            initialParentCompany:
                                                                parentCompany,
                                                            initialparentOrigin:
                                                                parentOrigin),
                                                  ),
                                                );
                                              },
                                              // Pas de borderRadius ici car c'est un élément du milieu
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                                    .grey[600],
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
                                                );
                                              },
                                              borderRadius: const BorderRadius
                                                  .only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(
                                                      12)), // Arrondi correspondant au Container
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                                    .grey[600],
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
                                                );
                                              },
                                              borderRadius: const BorderRadius
                                                  .only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight: Radius.circular(
                                                      12)), // Arrondi correspondant au Container
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                                    .grey[600],
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
        ],
      ),
    );
  }
}
