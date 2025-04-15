import 'dart:io';
import 'package:detrumpezvous/barcode_scanner_screen.dart';
import 'package:detrumpezvous/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Met à jour le fichier blacklist depuis GitHub puis navigue vers BarcodeScannerScreen
    updateAndSaveBrands().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BarcodeScannerScreen()),
          (route) => false,
        );
      });
    });
  }

  // Retourne le fichier local mis à jour ou non
  Future<File> _getLocalFile(String file) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$file.json');
  }

  // Télécharge le fichier depuis GitHub et le sauvegarde localement
  Future<void> updateAndSaveBrands() async {
    String remoteUrl =
        "https://raw.githubusercontent.com/Sacha213/detrumpez-vous/main/assets/brandlist.json";
    try {
      final response = await http.get(Uri.parse(remoteUrl));
      if (response.statusCode == 200) {
        final File file = await _getLocalFile("brandlist");
        // Sauvegarde la réponse dans le fichier local
        await file.writeAsString(response.body);
      } else {
        // En cas d'erreur, on peut garder la version local "embarquée" si besoin
        debugPrint(
            "Erreur lors du téléchargement du fichier distant : ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Exception lors du téléchargement : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2,
                      blurRadius: 16,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: const Image(
                      alignment: Alignment.centerLeft,
                      width: 80,
                      height: 80,
                      image: AssetImage('assets/icon.png')),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).welcome,
                style: const TextStyle(
                  //color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Détrumpez-vous!",
                style: TextStyle(
                  //color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).appDescription,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 80),
              const Center(
                child: CupertinoActivityIndicator(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
