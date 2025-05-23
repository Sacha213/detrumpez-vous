import 'dart:convert';

import 'package:detrumpezvous/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/services.dart'; // ← nouveau

class Country {
  final String code;
  final String name;
  Country({required this.code, required this.name});
}

class CountrySelectionScreen extends StatefulWidget {
  final Set<String> initiallySelected;
  const CountrySelectionScreen({
    super.key,
    this.initiallySelected = const {},
  });

  @override
  CountrySelectionScreenState createState() => CountrySelectionScreenState();
}

class CountrySelectionScreenState extends State<CountrySelectionScreen> {
  List<Country> _allCountries = [];
  List<Country> _filtered = [];
  late Set<String> _selectedCodes;
  String _search = '';

  @override
  void initState() {
    super.initState();
    _loadCountryList();

    _selectedCodes = Set.from(widget.initiallySelected);
  }

  Future<void> _loadCountryList() async {
    final jsonStr = await rootBundle.loadString('assets/countries.json');
    final List list = json.decode(jsonStr);
    _allCountries = list.map((e) {
      return Country(
        code: (e['code'] as String).toUpperCase(),
        name: e['name'] as String,
      );
    }).toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    setState(() {
      _filtered = List.from(_allCountries);
      _selectedCodes = Set.from(widget.initiallySelected);
    });
  }

  void _onSearchChanged(String v) {
    setState(() {
      _search = v.toLowerCase();
      _filtered = _allCountries.where((c) {
        return c.name.toLowerCase().contains(_search) ||
            c.code.toLowerCase().contains(_search);
      }).toList();
    });
  }

  void _onDone() {
    Navigator.pop(context, _selectedCodes);
  }

  void _toggle(Country c) {
    setState(() {
      if (_selectedCodes.contains(c.code)) {
        _selectedCodes.remove(c.code);
      } else {
        _selectedCodes.add(c.code);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop:
            false, // Indique que nous allons gérer la navigation retour manuellement
        onPopInvokedWithResult: (bool didPop, Set<String>? result) {
          // Si la navigation n'a pas eu lieu (parce que canPop est false),
          // alors nous exécutons notre logique personnalisée.
          // Le paramètre 'result' contiendrait la valeur avec laquelle la route
          // aurait été "popée" si canPop était true et que la pop avait réussi.
          // Dans notre cas, nous l'ignorons car _onDone() gère le pop.
          if (didPop) {
            return;
          }
          _onDone();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                S.of(context).countrySelectionScreenTitle), // Titre de la page
            backgroundColor: Colors.white, // Ou la couleur de ton thème
            foregroundColor:
                Colors.black, // Couleur du titre et de l'icône retour
            elevation: 1, // Légère ombre
          ),
          backgroundColor:
              CupertinoColors.systemGroupedBackground, // Fond de la page
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CupertinoSearchTextField(
                    placeholder: S.of(context).searchCountryPlaceholder,
                    onChanged: _onSearchChanged,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filtered.length,
                    itemBuilder: (ctx, i) {
                      final c = _filtered[i];
                      final selected = _selectedCodes.contains(c.code);
                      return GestureDetector(
                        onTap: () => _toggle(c),
                        child: Container(
                          color: CupertinoColors.systemGroupedBackground,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                CountryFlag.fromCountryCode(
                                  c.code.toUpperCase(),
                                  width: 32,
                                  height: 24,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    c.name,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                if (selected)
                                  const Icon(
                                      CupertinoIcons.check_mark_circled_solid,
                                      color: CupertinoColors.activeBlue),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
