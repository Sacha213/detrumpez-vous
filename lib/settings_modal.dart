import 'package:detrumpezvous/criteria_screen.dart';
import 'package:detrumpezvous/generated/l10n.dart';
import 'package:detrumpezvous/language_settings_screen.dart';
import 'package:detrumpezvous/preferences_screen.dart';
import 'package:detrumpezvous/report_problem_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsModal extends StatefulWidget {
  final String barcode;
  final String brand;
  const SettingsModal({super.key, required this.barcode, required this.brand});

  @override
  SettingsModalState createState() => SettingsModalState();
}

class SettingsModalState extends State<SettingsModal> {
  bool _isContributionModeEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadContributionMode();
  }

  Future<void> _loadContributionMode() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isContributionModeEnabled = prefs.getBool('contributionMode') ?? true;
    });
  }

  Future<void> _saveContributionMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('contributionMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // Ou Container avec une couleur
      color: CupertinoColors
          .systemGroupedBackground, // Couleur de fond de la modal
      child: SafeArea(
        // Important pour ne pas empiéter sur les zones système
        top:
            false, // La SafeArea du haut est gérée par la modal elle-même ou pas nécessaire ici
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // C'est la clé pour prendre la taille minimale
          children: [
            // Recréer un en-tête personnalisé pour le titre et le bouton de fermeture
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).settingsTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: CupertinoColors.systemGrey5,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CupertinoIcons.clear,
                        size: 20,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CupertinoListSection.insetGrouped(
              header: Text(S.of(context).general),
              children: [
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.globe),
                  title: Text(S.of(context).languageSelection),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => const LanguageSettingsScreen()),
                    );
                  },
                ),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.slider_horizontal_3),
                  title: Text(S.of(context).preferences),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => const PreferencesScreen()),
                    );
                  },
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text(S.of(context).contribution),
              children: [
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.hand_raised),
                  title: Text(S.of(context).enableContributorMode),
                  trailing: CupertinoSwitch(
                    value: _isContributionModeEnabled,
                    onChanged: (v) {
                      setState(() => _isContributionModeEnabled = v);
                      _saveContributionMode(v);
                    },
                  ),
                  onTap: () {
                    setState(() => _isContributionModeEnabled =
                        !_isContributionModeEnabled);
                    _saveContributionMode(_isContributionModeEnabled);
                  },
                ),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.info_circle),
                  title: Text(S.of(context).contributorModeInfo),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const CriteriaScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text(S.of(context).supportCommunity),
              children: [
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.link),
                  title: Text(S.of(context).visitWebsite),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () async {
                    final uri = Uri.parse('https://www.detrumpez-vous.com');
                    if (!await launchUrl(uri,
                        mode: LaunchMode.externalApplication)) {
                      // ignore: use_build_context_synchronously
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text(S.of(context).errorTitle),
                          content: Text(S.of(context)
                              .unableToOpenLink), // Utiliser la clé localisée
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.camera_circle),
                  title: Text(S.of(context).followUsOnInstagram),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () async {
                    final uri = Uri.parse(
                        'https://www.instagram.com/detrumpify_yourself/');
                    if (!await launchUrl(uri,
                        mode: LaunchMode.externalApplication)) {
                      showCupertinoDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                          title: Text(S.of(context).errorTitle),
                          content: Text(S.of(context).unableToOpenInstagram),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
                CupertinoListTile(
                  leading: const Icon(CupertinoIcons.exclamationmark_bubble),
                  title: Text(S.of(context).reportProblem),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => ReportProblemScreen(
                          barcode: widget.barcode,
                          brand: widget.brand,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
