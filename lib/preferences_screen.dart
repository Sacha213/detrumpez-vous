import 'package:detrumpezvous/generated/l10n.dart';
import 'package:flutter/cupertino.dart'; // Importer Cupertino
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  PreferencesScreenState createState() => PreferencesScreenState();
}

class PreferencesScreenState extends State<PreferencesScreen> {
  bool _showTrumpHead = false;
  bool _boycottMode = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _showTrumpHead = prefs.getBool('isTrumpShowed') ?? false;
      _boycottMode = prefs.getBool('boycottMode') ?? false;
    });
  }

  Future<void> _saveShowTrump(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTrumpShowed', value);
  }

  Future<void> _saveBoycottMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('boycottMode', value);
  }

  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('usaScanCount', 0);
    await prefs.setInt('safeScanCount', 0);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(S.of(context).counterResetSuccess)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).preferences),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor:
          CupertinoColors.systemGroupedBackground, // Fond iOS pour le corps
      body: SafeArea(
        child: ListView(
          // Garder ListView pour permettre le défilement global des sections
          children: [
            CupertinoListSection.insetGrouped(
              header: Text(S.of(context).display),
              children: [
                CupertinoListTile(
                    title: Text(S.of(context).showTrumpHead),
                    trailing: CupertinoSwitch(
                      value: _showTrumpHead,
                      onChanged: (v) {
                        setState(() => _showTrumpHead = v);
                        _saveShowTrump(v);
                      },
                    ),
                    // Ajout d'un onTap pour basculer en cliquant sur la ligne
                    onTap: () {
                      setState(() => _showTrumpHead = !_showTrumpHead);
                      _saveShowTrump(!_showTrumpHead);
                    }),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text(S.of(context).counter),
              children: [
                CupertinoListTile(
                  title: Text(S.of(context).resetCounter),
                  trailing: const Icon(CupertinoIcons.refresh,
                      color: CupertinoColors.systemRed), // Icône iOS
                  onTap: _resetCounter,
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text(S.of(context).mode),
              children: [
                CupertinoListTile(
                    title: Text(S.of(context).enableBoycottMode),
                    trailing: CupertinoSwitch(
                      value: _boycottMode,
                      onChanged: (v) {
                        setState(() => _boycottMode = v);
                        _saveBoycottMode(v);
                      },
                    ),
                    // Ajout d'un onTap pour basculer en cliquant sur la ligne
                    onTap: () {
                      setState(() => _boycottMode = !_boycottMode);
                      _saveBoycottMode(!_boycottMode);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
