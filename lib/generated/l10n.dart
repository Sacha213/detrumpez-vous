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

  /// `Welcome to`
  String get welcome {
    return Intl.message('Welcome to', name: 'welcome', desc: '', args: []);
  }

  /// `Scan your product's barcode to find out if the brand is owned by an American company.`
  String get appDescription {
    return Intl.message(
      'Scan your product\'s barcode to find out if the brand is owned by an American company.',
      name: 'appDescription',
      desc: '',
      args: [],
    );
  }

  /// `Scan Barcode`
  String get appTitle {
    return Intl.message('Scan Barcode', name: 'appTitle', desc: '', args: []);
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

  /// `Enter a food brand`
  String get manualSearchPlaceholder {
    return Intl.message(
      'Enter a food brand',
      name: 'manualSearchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `This brand is not present in our database.`
  String get descriptionNotFound {
    return Intl.message(
      'This brand is not present in our database.',
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

  /// `This product does not seem to come from an American company.`
  String get safeProductMessage {
    return Intl.message(
      'This product does not seem to come from an American company.',
      name: 'safeProductMessage',
      desc: '',
      args: [],
    );
  }

  /// `This product comes from an American company!`
  String get usaProductMessage {
    return Intl.message(
      'This product comes from an American company!',
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

  /// `A problem with a product?`
  String get problemReportTitle {
    return Intl.message(
      'A problem with a product?',
      name: 'problemReportTitle',
      desc: '',
      args: [],
    );
  }

  /// `We can make mistakes. If you spot one, please email us the brand name so we can update our list.`
  String get problemReportMessage {
    return Intl.message(
      'We can make mistakes. If you spot one, please email us the brand name so we can update our list.',
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

  /// `View criteria`
  String get viewCriteria {
    return Intl.message(
      'View criteria',
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

  /// `Ben & Jerry's is an American brand but was acquired by Unilever (an Anglo-Dutch multinational) in 2000. Thus, the brand is not considered American.`
  String get companySafeExplanation {
    return Intl.message(
      'Ben & Jerry\'s is an American brand but was acquired by Unilever (an Anglo-Dutch multinational) in 2000. Thus, the brand is not considered American.',
      name: 'companySafeExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Vahiné is a French brand but was acquired by the American group McCormick in 2000. Thus, the brand is considered American.`
  String get companyUsaExplanation {
    return Intl.message(
      'Vahiné is a French brand but was acquired by the American group McCormick in 2000. Thus, the brand is considered American.',
      name: 'companyUsaExplanation',
      desc: '',
      args: [],
    );
  }

  /// `⚠️ Make sure to enter a correctly spelled food brand to avoid errors.`
  String get searchWarning {
    return Intl.message(
      '⚠️ Make sure to enter a correctly spelled food brand to avoid errors.',
      name: 'searchWarning',
      desc: '',
      args: [],
    );
  }

  /// `Add a product`
  String get addProductTitle {
    return Intl.message(
      'Add a product',
      name: 'addProductTitle',
      desc: '',
      args: [],
    );
  }

  /// `Help us by adding a product to the database`
  String get addProductHelp {
    return Intl.message(
      'Help us by adding a product to the database',
      name: 'addProductHelp',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Select a category`
  String get selectCategory {
    return Intl.message(
      'Select a category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get successTitle {
    return Intl.message('Success', name: 'successTitle', desc: '', args: []);
  }

  /// `Product added successfully!`
  String get successMessage {
    return Intl.message(
      'Product added successfully!',
      name: 'successMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorTitle {
    return Intl.message('Error', name: 'errorTitle', desc: '', args: []);
  }

  /// `An error occurred while adding the product.`
  String get errorMessage {
    return Intl.message(
      'An error occurred while adding the product.',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields.`
  String get fillAllFields {
    return Intl.message(
      'Please fill in all fields.',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get barcode {
    return Intl.message('Barcode', name: 'barcode', desc: '', args: []);
  }

  /// `Product name`
  String get productName {
    return Intl.message(
      'Product name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Enter the product name`
  String get productNamePlaceholder {
    return Intl.message(
      'Enter the product name',
      name: 'productNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Brand name`
  String get brandName {
    return Intl.message('Brand name', name: 'brandName', desc: '', args: []);
  }

  /// `Ex: L'Oréal`
  String get brandNamePlaceholder {
    return Intl.message(
      'Ex: L\'Oréal',
      name: 'brandNamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get alimentation {
    return Intl.message('Food', name: 'alimentation', desc: '', args: []);
  }

  /// `Cosmetic`
  String get cosmetique {
    return Intl.message('Cosmetic', name: 'cosmetique', desc: '', args: []);
  }

  /// `Pet food`
  String get alimentationAnimaux {
    return Intl.message(
      'Pet food',
      name: 'alimentationAnimaux',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get autre {
    return Intl.message('Other', name: 'autre', desc: '', args: []);
  }

  /// `Add product`
  String get addProductButton {
    return Intl.message(
      'Add product',
      name: 'addProductButton',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem`
  String get reportProblemTitle {
    return Intl.message(
      'Report a problem',
      name: 'reportProblemTitle',
      desc: '',
      args: [],
    );
  }

  /// `Help us improve the application`
  String get reportProblemHelpUs {
    return Intl.message(
      'Help us improve the application',
      name: 'reportProblemHelpUs',
      desc: '',
      args: [],
    );
  }

  /// `Describe the problem encountered with the product or application.`
  String get reportProblemDescriptionPrompt {
    return Intl.message(
      'Describe the problem encountered with the product or application.',
      name: 'reportProblemDescriptionPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Describe the problem or error...`
  String get reportProblemHintText {
    return Intl.message(
      'Describe the problem or error...',
      name: 'reportProblemHintText',
      desc: '',
      args: [],
    );
  }

  /// `Please describe the problem.`
  String get reportProblemValidationErrorEmpty {
    return Intl.message(
      'Please describe the problem.',
      name: 'reportProblemValidationErrorEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please provide more details (10 characters min).`
  String get reportProblemValidationErrorLength {
    return Intl.message(
      'Please provide more details (10 characters min).',
      name: 'reportProblemValidationErrorLength',
      desc: '',
      args: [],
    );
  }

  /// `Send report`
  String get reportProblemSendButton {
    return Intl.message(
      'Send report',
      name: 'reportProblemSendButton',
      desc: '',
      args: [],
    );
  }

  /// `Thank you! Your report has been sent.`
  String get reportProblemSuccessMessage {
    return Intl.message(
      'Thank you! Your report has been sent.',
      name: 'reportProblemSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error sending report. Please try again.`
  String get reportProblemErrorMessage {
    return Intl.message(
      'Error sending report. Please try again.',
      name: 'reportProblemErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Parent company`
  String get parentCompanyLabel {
    return Intl.message(
      'Parent company',
      name: 'parentCompanyLabel',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get companyLabel {
    return Intl.message('Company', name: 'companyLabel', desc: '', args: []);
  }

  /// `Image source`
  String get imageSourceTitle {
    return Intl.message(
      'Image source',
      name: 'imageSourceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose a source`
  String get imageSourceMessage {
    return Intl.message(
      'Choose a source',
      name: 'imageSourceMessage',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Please select a category.`
  String get selectCategoryError {
    return Intl.message(
      'Please select a category.',
      name: 'selectCategoryError',
      desc: '',
      args: [],
    );
  }

  /// `Please select a photo.`
  String get selectPhotoError {
    return Intl.message(
      'Please select a photo.',
      name: 'selectPhotoError',
      desc: '',
      args: [],
    );
  }

  /// `Sending information...`
  String get sendingInfo {
    return Intl.message(
      'Sending information...',
      name: 'sendingInfo',
      desc: '',
      args: [],
    );
  }

  /// `Sending image...`
  String get sendingImage {
    return Intl.message(
      'Sending image...',
      name: 'sendingImage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send text information (status {statusCode}). Check logs for HTML response.`
  String textSubmissionFailed(Object statusCode) {
    return Intl.message(
      'Failed to send text information (status $statusCode). Check logs for HTML response.',
      name: 'textSubmissionFailed',
      desc: '',
      args: [statusCode],
    );
  }

  /// `Error uploading image.`
  String get imageUploadError {
    return Intl.message(
      'Error uploading image.',
      name: 'imageUploadError',
      desc: '',
      args: [],
    );
  }

  /// `Text information was sent, but image upload failed.`
  String get textDataSentButImageFailed {
    return Intl.message(
      'Text information was sent, but image upload failed.',
      name: 'textDataSentButImageFailed',
      desc: '',
      args: [],
    );
  }

  /// `Error during submission.`
  String get submissionError {
    return Intl.message(
      'Error during submission.',
      name: 'submissionError',
      desc: '',
      args: [],
    );
  }

  /// `Product and image added successfully!`
  String get productAndImageAddedSuccess {
    return Intl.message(
      'Product and image added successfully!',
      name: 'productAndImageAddedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Barcode: `
  String get barcodeLabel {
    return Intl.message('Barcode: ', name: 'barcodeLabel', desc: '', args: []);
  }

  /// `Photo`
  String get photo {
    return Intl.message('Photo', name: 'photo', desc: '', args: []);
  }

  /// `Add a photo`
  String get addPhoto {
    return Intl.message('Add a photo', name: 'addPhoto', desc: '', args: []);
  }

  /// `Error selecting image`
  String get imagePickError {
    return Intl.message(
      'Error selecting image',
      name: 'imagePickError',
      desc: '',
      args: [],
    );
  }

  /// `Add information`
  String get addProductInfoTitle {
    return Intl.message(
      'Add information',
      name: 'addProductInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Complete product information`
  String get addProductInfoHeadline {
    return Intl.message(
      'Complete product information',
      name: 'addProductInfoHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Provide missing details for barcode: {barcode}`
  String addProductInfoSubHeadline(Object barcode) {
    return Intl.message(
      'Provide missing details for barcode: $barcode',
      name: 'addProductInfoSubHeadline',
      desc: '',
      args: [barcode],
    );
  }

  /// `Brand *`
  String get brandLabelRequired {
    return Intl.message(
      'Brand *',
      name: 'brandLabelRequired',
      desc: '',
      args: [],
    );
  }

  /// `Main brand name`
  String get brandHint {
    return Intl.message(
      'Main brand name',
      name: 'brandHint',
      desc: '',
      args: [],
    );
  }

  /// `Description *`
  String get descriptionLabelRequired {
    return Intl.message(
      'Description *',
      name: 'descriptionLabelRequired',
      desc: '',
      args: [],
    );
  }

  /// `Short product description`
  String get descriptionHint {
    return Intl.message(
      'Short product description',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Parent company (Optional)`
  String get parentCompanyLabelOptional {
    return Intl.message(
      'Parent company (Optional)',
      name: 'parentCompanyLabelOptional',
      desc: '',
      args: [],
    );
  }

  /// `Name of the owning company`
  String get parentCompanyHint {
    return Intl.message(
      'Name of the owning company',
      name: 'parentCompanyHint',
      desc: '',
      args: [],
    );
  }

  /// `Country of origin`
  String get originLabel {
    return Intl.message(
      'Country of origin',
      name: 'originLabel',
      desc: '',
      args: [],
    );
  }

  /// `Parent company's country of origin (Optional)`
  String get parentOriginLabelOptional {
    return Intl.message(
      'Parent company\'s country of origin (Optional)',
      name: 'parentOriginLabelOptional',
      desc: '',
      args: [],
    );
  }

  /// `Ex: France, USA, China...`
  String get parentOriginHint {
    return Intl.message(
      'Ex: France, USA, China...',
      name: 'parentOriginHint',
      desc: '',
      args: [],
    );
  }

  /// `This field is required.`
  String get fieldRequiredError {
    return Intl.message(
      'This field is required.',
      name: 'fieldRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Add information`
  String get addProductInfoButton {
    return Intl.message(
      'Add information',
      name: 'addProductInfoButton',
      desc: '',
      args: [],
    );
  }

  /// `Thank you! Product information added.`
  String get addProductInfoSuccess {
    return Intl.message(
      'Thank you! Product information added.',
      name: 'addProductInfoSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error sending information. Please try again.`
  String get addProductInfoError {
    return Intl.message(
      'Error sending information. Please try again.',
      name: 'addProductInfoError',
      desc: '',
      args: [],
    );
  }

  /// `Add information`
  String get addInfoTitle {
    return Intl.message(
      'Add information',
      name: 'addInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Click here to complete the info`
  String get addInfoSubtitle {
    return Intl.message(
      'Click here to complete the info',
      name: 'addInfoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem`
  String get reportProblemActionTitle {
    return Intl.message(
      'Report a problem',
      name: 'reportProblemActionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Click here to report an issue`
  String get reportProblemActionSubtitle {
    return Intl.message(
      'Click here to report an issue',
      name: 'reportProblemActionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `How are companies classified?`
  String get classificationInfoTitle {
    return Intl.message(
      'How are companies classified?',
      name: 'classificationInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Click here to discover our criteria`
  String get classificationInfoSubtitle {
    return Intl.message(
      'Click here to discover our criteria',
      name: 'classificationInfoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Scan a barcode`
  String get scanBarcodeLabel {
    return Intl.message(
      'Scan a barcode',
      name: 'scanBarcodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients origin`
  String get ingredientsOriginLabel {
    return Intl.message(
      'Ingredients origin',
      name: 'ingredientsOriginLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add ingredient photo`
  String get addIngredientPhoto {
    return Intl.message(
      'Add ingredient photo',
      name: 'addIngredientPhoto',
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
