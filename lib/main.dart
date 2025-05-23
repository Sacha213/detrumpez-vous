import 'dart:io';
import 'package:detrumpezvous/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart'; // Classe générée pour les traductions
import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  final prefs = await SharedPreferences.getInstance();
  final code = prefs.getString('languageCode');
  runApp(MyApp(initialLocale: code == null ? null : Locale(code)));
}

class MyApp extends StatefulWidget {
  final Locale? initialLocale;
  const MyApp({super.key, this.initialLocale});

  static void setLocale(BuildContext context, Locale newLocale) {
    final state = context.findAncestorStateOfType<MyAppState>();
    state?._changeLocale(newLocale);
  }

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale? _locale;
  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  Future<void> _changeLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,

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
        Locale('nl', ''), // Néerlandais
        Locale('ja', ''), // Japonais
        Locale('da', ''), // Danois
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
