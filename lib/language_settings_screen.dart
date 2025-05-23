import 'package:flutter/cupertino.dart';
import 'package:detrumpezvous/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // pour MyApp.setLocale

class LanguageSettingsScreen extends StatelessWidget {
  const LanguageSettingsScreen({super.key});

  static const _names = {
    'en': 'English',
    'fr': 'Français',
    'es': 'Español',
    'zh': '中文', // Chinois (simplifié)
    'ar': 'العربية', // Arabe
    'hi': 'हिन्दी', // Hindi
    'ru': 'Русский', // Russe
    'de': 'Deutsch', // Allemand
    'pt': 'Português', // Portugais
    'it': 'Italiano', // Italien
    'nl': 'Nederlands', // Néerlandais
    'ja': '日本語', // Japonais
    'da': 'Dansk', // Danois
  };

  @override
  Widget build(BuildContext context) {
    final current = Localizations.localeOf(context);
    final locales = S.delegate.supportedLocales;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).languageSelection), // Utiliser S.current ici
        backgroundColor: Colors.white, // Ou la couleur de ton thème
        foregroundColor: Colors.black, // Couleur du titre et de l'icône retour
        elevation: 1, // Légère ombre
      ),
      backgroundColor: Colors.white, // Fond de la page
      body: SafeArea(
        child: ListView.builder(
          itemCount: locales.length,
          itemBuilder: (ctx, i) {
            final locale = locales[i];
            final code = locale.languageCode;
            final name = _names[code] ?? code;
            return CupertinoListTile(
              title: Text(name),
              trailing: current.languageCode == code
                  ? const Icon(CupertinoIcons.check_mark_circled_solid,
                      color: CupertinoColors.activeBlue)
                  : null,
              onTap: () {
                MyApp.setLocale(context, locale);
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
