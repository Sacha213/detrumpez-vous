import 'dart:convert';
import 'dart:io';
import 'package:detrumpezvous/add_product.dart';
import 'package:http/http.dart' as http;
import 'package:detrumpezvous/corner_painter.dart';
import 'package:detrumpezvous/generated/l10n.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:logger/logger.dart';
import 'package:translator/translator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Logger logger = Logger();
final GoogleTranslator translator = GoogleTranslator();

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  BarcodeScannerScreenState createState() => BarcodeScannerScreenState();
}

class BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  // Variables d'état
  String barcode = "";
  String brand = S.current.brandNotFound;
  String description = S.current.descriptionNotFound;
  String source = S.current.sourceNotFound;
  bool isProductFromUSA = false;
  bool manualSearchUsed = false;
  bool isProductFound = false; // indique si le produit est trouvé ou non
  List<dynamic> blacklistIndex = [];
  List<dynamic> whitelistIndex = [];
  bool isProcessing = false; // pour éviter plusieurs scans simultanés
  bool isBrandInList = false; // pour savoir si le produit est dans une liste

  // Ajoutez ce contrôleur dans votre state:
  final TextEditingController manualSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadBrands();
  }

  @override
  void dispose() {
    manualSearchController.dispose();
    super.dispose();
  }

  // Retourne le fichier local mis à jour ou non
  Future<File> _getLocalFile(String file) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$file.json');
  }

  // Méthode pour charger le fichier mis à jour (ou la version par défaut depuis assets)
  Future<void> loadBrands() async {
    File localFile = await _getLocalFile("blacklist");
    try {
      if (await localFile.exists()) {
        final String contents = await localFile.readAsString();
        blacklistIndex = json.decode(contents);
      } else {
        // Si le fichier n'existe pas, chargez la version embarquée
        final String jsonStr =
            await rootBundle.loadString('assets/blacklist.json');
        blacklistIndex = json.decode(jsonStr);
      }
    } catch (e) {
      // En cas d'erreur, retournez une liste vide ou gérez l'erreur comme vous le souhaitez
      blacklistIndex = [];
    }

    localFile = await _getLocalFile("whitelist");
    try {
      if (await localFile.exists()) {
        final String contents = await localFile.readAsString();
        whitelistIndex = json.decode(contents);
      } else {
        // Si le fichier n'existe pas, chargez la version embarquée
        final String jsonStr =
            await rootBundle.loadString('assets/whitelist.json');
        whitelistIndex = json.decode(jsonStr);
      }
    } catch (e) {
      // En cas d'erreur, retournez une liste vide ou gérez l'erreur comme vous le souhaitez
      whitelistIndex = [];
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
        final Map<String, dynamic> found = blacklistIndex.firstWhere((brand) {
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

    // Si rien n'est trouvé dans blacklistIndex, recherche dans hitelistIndex
    for (final candidate in candidates) {
      final String normalizedCandidate = normalizeBrandName(candidate);
      try {
        final Map<String, dynamic> found = whitelistIndex.firstWhere((brand) {
          final String normalizedName =
              (brand["normalizedName"] ?? "").toString().toLowerCase();
          return normalizedName == normalizedCandidate;
        }, orElse: () => <String, dynamic>{});
        if (found.isNotEmpty) {
          return found;
        }
      } catch (e) {
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
      isProductFound = productData != null;
      isProductFromUSA = resultJson["origin"] == "USA";
      isBrandInList = resultJson.isNotEmpty;
    });

    // Si la marque n'est pas trouvée dans les listes, l'envoyer sur Firebase
    if (!isBrandInList && productData != null && productData.isNotEmpty) {
      await FirebaseFirestore.instance.collection('unknown_brands').add({
        'brand_name': productData,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    // Déclenche un retour haptique (vibration légère)
    if (isProductFound) {
      HapticFeedback.mediumImpact();
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          // La zone supérieure limitée à 70 % de l'écran
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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(280, 140),
                        painter: CornerPainter(
                          color: const Color(0xFFFDCC0B),
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
                ),
                if (!isProductFound && barcode.isNotEmpty)
                  Positioned(
                    bottom: 32,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.15), // Ombre principale (plus légère)
                                offset: const Offset(
                                    2, 2), // Décalage réduit (x, y)
                                blurRadius: 6, // Rayon de flou réduit
                                spreadRadius:
                                    0.5, // Expansion de l'ombre réduite
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(
                                    0.5), // Ombre claire pour effet 3D
                                offset: const Offset(
                                    -2, -2), // Décalage inverse réduit
                                blurRadius: 6, // Rayon de flou réduit
                                spreadRadius:
                                    0.5, // Expansion de l'ombre réduite
                              ),
                            ],
                          ),
                          child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(32),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AddProduct(
                                    barcode: barcode,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              S
                                  .of(context)
                                  .addProductButton, // Utilisation de la traduction
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: CupertinoButton(
                    color: Colors.grey,
                    padding: const EdgeInsets.all(0),
                    borderRadius: BorderRadius.circular(32),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.info_outline, color: Colors.white, size: 32),
                      ],
                    ),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text(S.of(context).companyCriteriaTitle),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(S.of(context).companyCriteriaContent),
                                const SizedBox(height: 8),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        S.of(context).safe,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      S.of(context).companySafeExplanation,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red, width: 2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        S.of(context).usa,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      S.of(context).companyUsaExplanation,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                textStyle: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                                onPressed: () => Navigator.pop(context),
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // DraggableScrollableSheet toujours affiché en bas
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.30,
            maxChildSize: 0.90,
            snap: true,
            builder: (context, scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: !isProductFound
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
                                      const SizedBox(height: 8),
                                      // Autres widgets d'affichage produit...
                                      Row(
                                        children: [
                                          Container(
                                            width: 96,
                                            height: 96,
                                            decoration: !isProductFound
                                                ? const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey,
                                                  )
                                                : (!isProductFromUSA
                                                    ? const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.green,
                                                      )
                                                    : const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/trump.jpg"),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )),
                                            child: !isProductFound
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
                                                    !isProductFound
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
                                                      color: !isProductFound
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
                                                        color: !isProductFound
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
                                                    !isProductFound
                                                        ? S.of(context).unknown
                                                        : (!isProductFromUSA
                                                            ? S.of(context).safe
                                                            : S
                                                                .of(context)
                                                                .usa),
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: !isProductFound
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
                                      const SizedBox(height: 16),
                                      Text(
                                        description,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8),
                                      if (!isBrandInList && manualSearchUsed)
                                        Text(
                                          S.of(context).searchWarning,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 14, color: Colors.red),
                                        ),
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
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        S.of(context).problemReportTitle,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.red),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        S.of(context).problemReportMessage,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 8),
                                      GestureDetector(
                                        onTap: () async {
                                          final mailtoLink = Mailto(
                                            to: ['contact@detrumpez-vous.com'],
                                            subject: 'Product Issue Report',
                                            body:
                                                'Hello,\n\nI would like to report a product issue:\n',
                                          );
                                          final String url = '$mailtoLink';
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {
                                            debugPrint(
                                                "Could not launch email client");
                                          }
                                        },
                                        child: const Text(
                                          "contact@detrumpez-vous.com",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
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
