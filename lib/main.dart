import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/services.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart'; // Classe générée pour les traductions

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate, // Classe générée pour les traductions
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // Anglais
        Locale('fr', ''), // Français
        Locale('es', ''), // Espagnol
        Locale('zh', ''), // Chinois (simplifié)
        Locale('ar', ''), // Arabe
        Locale('hi', ''), // Hindi
        Locale('ru', ''), // Russe
        Locale('de', ''), // Allemand
        Locale('pt', ''), // Portugais
        Locale('it', ''), // Italien
      ],
      home: const BarcodeScannerScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade50,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue.shade300,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  BarcodeScannerScreenState createState() => BarcodeScannerScreenState();
}

class BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  // Variables d'état
  String barcode = "";
  String productName = S.current.productNotFound;
  String brand = S.current.brandNotFound;
  String description = S.current.descriptionNotFound;
  String source = S.current.sourceNotFound;
  bool isProductFromUSA = false;
  bool isProductFound = false; // indique si le produit est trouvé ou non
  Map<String, dynamic>? jsonData;
  bool isProcessing = false; // pour éviter plusieurs scans simultanés

  @override
  void initState() {
    super.initState();
    loadBrands();
  }

  /// Charge le fichier JSON depuis les assets une seule fois.
  Future<void> loadBrands() async {
    final String jsonStr = await rootBundle.loadString('assets/blacklist.json');
    setState(() {
      jsonData = json.decode(jsonStr);
    });
  }

  /// Recherche une information de marque par fuzzy match.
  /// Remplace les virgules par des espaces et normalise la chaîne.
  Future<Map<String, dynamic>> getBrandInfo(String brandName) async {
    final String normalizedSearch = removeDiacritics(
      brandName
          .toLowerCase()
          .replaceAll(RegExp(r"[’‘`´]"), "'")
          .replaceAll(',', ' ')
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim(),
    );

    Map<String, dynamic>? result;
    jsonData?.forEach((company, brands) {
      for (var brand in brands) {
        final String normalizedKey = removeDiacritics(
          brand["name"]
              .toLowerCase()
              .replaceAll(RegExp(r"[’‘`´]"), "'")
              .replaceAll(',', ' ')
              .replaceAll(RegExp(r'\s+'), ' ')
              .trim(),
        );
        final RegExp regExp =
            RegExp(r'\b' + RegExp.escape(normalizedSearch) + r'\b');

        if (regExp.hasMatch(normalizedKey)) {
          result = brand as Map<String, dynamic>;
          break;
        }
      }
      if (result != null) return;
    });
    return result ?? {};
  }

  /// Récupère les informations d'un produit via Open Food Facts.
  Future<void> fetchProductInfo(String barcode) async {
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
    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(config);
    if (result.product != null) {
      // Le code barre est trouvé
      isProductFound = true;
      Map<String, dynamic> resultJson =
          await getBrandInfo(result.product!.brands ?? "");
      setState(() {
        productName =
            result.product?.productName ?? S.of(context).productNotFound;
        brand = result.product?.brands ?? S.of(context).brandNotFound;
        description =
            resultJson["description"] ?? S.of(context).descriptionNotFound;
        source = resultJson["source"] ?? S.of(context).sourceNotFound;
        isProductFromUSA = resultJson.isNotEmpty;
      });
    } else {
      // Le code barre n'a pas été trouvé
      isProductFound = false;
      setState(() {
        productName = S.of(context).productNotFound;
        brand = S.of(context).brandNotFound;
        description = S.of(context).descriptionNotFound;
        source = S.of(context).sourceNotFound;
        isProductFromUSA = false;
      });
    }
  }

  /// Traitement lors de la détection d'un code barre dans la partie scanner.
  Future<void> onBarcodeDetected(String code) async {
    if (isProcessing) return;
    setState(() {
      isProcessing = true;
      barcode = code;
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
    if (!mounted) return;
    Navigator.pop(context); // Fermer la popup
    setState(() {
      isProcessing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 51, 153, 1.0), // Fond bleu
        title: Text(S.of(context).appTitle,
            style: const TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/europe.png', // Chemin vers votre image du drapeau de l'Europe
              height: 72, // Hauteur de l'image
              width: 72, // Largeur de l'image
            ),
          ),
        ],
      ),
      // Utilisation d'isProductFound pour afficher une couleur grise si aucun produit n'est trouvé
      backgroundColor: !isProductFound
          ? Colors.grey.shade100
          : (!isProductFromUSA ? Colors.green.shade100 : Colors.red.shade100),
      body: Column(
        children: [
          // Partie supérieure : scanner via MobileScanner.
          Expanded(
            flex: 1,
            child: MobileScanner(
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
          ),
          // Partie inférieure : affichage des informations du produit.
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Photo de validation ou image de Trump.
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
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
                                        image: AssetImage("assets/trump.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                          child: !isProductFound
                              ? const Icon(
                                  Icons.question_mark,
                                  size: 100,
                                  color: Colors.white,
                                )
                              : (!isProductFromUSA
                                  ? const Icon(
                                      Icons.check,
                                      size: 100,
                                      color: Colors.white,
                                    )
                                  : Container()),
                        ),
                        const SizedBox(width: 16),
                        // Indication de l'origine.
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: !isProductFound
                                          ? Colors.grey
                                          : (!isProductFromUSA
                                              ? Colors.green
                                              : Colors.red),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  !isProductFound
                                      ? S.of(context).unknown
                                      : (!isProductFromUSA
                                          ? S.of(context).safe
                                          : S.of(context).usa),
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: !isProductFound
                                        ? Colors.grey
                                        : (!isProductFromUSA
                                            ? Colors.green
                                            : Colors.red),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                  !isProductFound
                                      ? S.of(context).unknownProductMessage
                                      : (!isProductFromUSA
                                          ? S.of(context).safeProductMessage
                                          : S.of(context).usaProductMessage),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: !isProductFound
                                        ? Colors.grey
                                        : (!isProductFromUSA
                                            ? Colors.green
                                            : Colors.red),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Détails de la marque et du produit.
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(brand,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "($source)",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Message de signalement de problème.
                    Text(
                      S.of(context).problemReportTitle,
                      style: const TextStyle(fontSize: 14, color: Colors.red),
                    ),
                    Text(
                      S.of(context).problemReportMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
