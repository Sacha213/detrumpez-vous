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

  /// `Welcome in`
  String get welcome {
    return Intl.message('Welcome in', name: 'welcome', desc: '', args: []);
  }

  /// `Scan your product's barcode to discover if the brand is owned by an American company.`
  String get appDescription {
    return Intl.message(
      'Scan your product\'s barcode to discover if the brand is owned by an American company.',
      name: 'appDescription',
      desc: '',
      args: [],
    );
  }

  /// `Scan the barcode`
  String get appTitle {
    return Intl.message(
      'Scan the barcode',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `NOT USA`
  String get safe {
    return Intl.message('NOT USA', name: 'safe', desc: '', args: []);
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

  /// `Brand not found`
  String get brandNotFound {
    return Intl.message(
      'Brand not found',
      name: 'brandNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Enter a grocery brand`
  String get manualSearchPlaceholder {
    return Intl.message(
      'Enter a grocery brand',
      name: 'manualSearchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `This brand is not in our American brand database.`
  String get descriptionNotFound {
    return Intl.message(
      'This brand is not in our American brand database.',
      name: 'descriptionNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Source not found`
  String get sourceNotFound {
    return Intl.message(
      'Source not found',
      name: 'sourceNotFound',
      desc: '',
      args: [],
    );
  }

  /// `This product does not appear to be from an American company.`
  String get safeProductMessage {
    return Intl.message(
      'This product does not appear to be from an American company.',
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

  /// `The product you searched for was not found in our database.`
  String get unknownProductMessage {
    return Intl.message(
      'The product you searched for was not found in our database.',
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

  /// `Our database already contains over 300 brands, but some still remain to be identified. If you spot an American product not listed, please email us the brand name to update our list.`
  String get problemReportMessage {
    return Intl.message(
      'Our database already contains over 300 brands, but some still remain to be identified. If you spot an American product not listed, please email us the brand name to update our list.',
      name: 'problemReportMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Validate`
  String get validate {
    return Intl.message('Validate', name: 'validate', desc: '', args: []);
  }

  /// `View Criteria`
  String get viewCriteria {
    return Intl.message(
      'View Criteria',
      name: 'viewCriteria',
      desc: '',
      args: [],
    );
  }

  /// `American Company Criteria`
  String get companyCriteriaTitle {
    return Intl.message(
      'American Company Criteria',
      name: 'companyCriteriaTitle',
      desc: '',
      args: [],
    );
  }

  /// `A brand is considered American if it belongs to an American group.`
  String get companyCriteriaContent {
    return Intl.message(
      'A brand is considered American if it belongs to an American group.',
      name: 'companyCriteriaContent',
      desc: '',
      args: [],
    );
  }

  /// `Ben & Jerry's is an American brand but was acquired by Unilever (an Anglo-Dutch multinational) in 2000. Therefore, the brand is not considered American.`
  String get companySafeExplanation {
    return Intl.message(
      'Ben & Jerry\'s is an American brand but was acquired by Unilever (an Anglo-Dutch multinational) in 2000. Therefore, the brand is not considered American.',
      name: 'companySafeExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Vahiné is a French brand but was acquired by the American group McCormick in 2000. Therefore, the brand is considered American.`
  String get companyUsaExplanation {
    return Intl.message(
      'Vahiné is a French brand but was acquired by the American group McCormick in 2000. Therefore, the brand is considered American.',
      name: 'companyUsaExplanation',
      desc: '',
      args: [],
    );
  }

  /// `⚠️ Please ensure you enter a correctly spelled food brand to avoid errors.`
  String get searchWarning {
    return Intl.message(
      '⚠️ Please ensure you enter a correctly spelled food brand to avoid errors.',
      name: 'searchWarning',
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
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'nl'),
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
