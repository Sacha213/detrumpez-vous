// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Scan a Food Product`
  String get appTitle {
    return Intl.message(
      'Scan a Food Product',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `SAFE`
  String get safe {
    return Intl.message('SAFE', name: 'safe', desc: '', args: []);
  }

  /// `USA`
  String get usa {
    return Intl.message('USA', name: 'usa', desc: '', args: []);
  }

  /// `UNKNOWN`
  String get unknown {
    return Intl.message('UNKNOWN', name: 'unknown', desc: '', args: []);
  }

  /// `Product not found`
  String get productNotFound {
    return Intl.message(
      'Product not found',
      name: 'productNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Unknown brand`
  String get brandNotFound {
    return Intl.message(
      'Unknown brand',
      name: 'brandNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Description not found`
  String get descriptionNotFound {
    return Intl.message(
      'Description not found',
      name: 'descriptionNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Unknown source`
  String get sourceNotFound {
    return Intl.message(
      'Unknown source',
      name: 'sourceNotFound',
      desc: '',
      args: [],
    );
  }

  /// `This product is not from an American company!`
  String get safeProductMessage {
    return Intl.message(
      'This product is not from an American company!',
      name: 'safeProductMessage',
      desc: '',
      args: [],
    );
  }

  /// `This product is from an American company!`
  String get usaProductMessage {
    return Intl.message(
      'This product is from an American company!',
      name: 'usaProductMessage',
      desc: '',
      args: [],
    );
  }

  /// `The searched product was not found in our database.`
  String get unknownProductMessage {
    return Intl.message(
      'The searched product was not found in our database.',
      name: 'unknownProductMessage',
      desc: '',
      args: [],
    );
  }

  /// `Problem with a product?`
  String get problemReportTitle {
    return Intl.message(
      'Problem with a product?',
      name: 'problemReportTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you have identified a product from the United States, please report it so we can add it to our list.`
  String get problemReportMessage {
    return Intl.message(
      'If you have identified a product from the United States, please report it so we can add it to our list.',
      name: 'problemReportMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
