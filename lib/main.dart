import 'dart:io';
import 'package:detrumpezvous/splash_screen.dart';
import 'package:flutter/material.dart';
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
      home:
          const SplashScreen(), // Utilisation du splash screen comme écran d'accueil
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
