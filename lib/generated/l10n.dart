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

  /// `Enter a brand`
  String get manualSearchPlaceholder {
    return Intl.message(
      'Enter a brand',
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
  String get food {
    return Intl.message('Food', name: 'food', desc: '', args: []);
  }

  /// `Beauty`
  String get beauty {
    return Intl.message('Beauty', name: 'beauty', desc: '', args: []);
  }

  /// `Pet food`
  String get petFood {
    return Intl.message('Pet food', name: 'petFood', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
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

  /// `Thank you! Your report has been submitted for review and will be processed within 48 hours.`
  String get reportProblemSuccessMessage {
    return Intl.message(
      'Thank you! Your report has been submitted for review and will be processed within 48 hours.',
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

  /// `Thank you! Your product information has been submitted for review and will be added within 48 hours.`
  String get addProductInfoSuccess {
    return Intl.message(
      'Thank you! Your product information has been submitted for review and will be added within 48 hours.',
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

  /// `Your Email (Optional)`
  String get reportProblemEmailLabel {
    return Intl.message(
      'Your Email (Optional)',
      name: 'reportProblemEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email if you'd like a follow-up`
  String get reportProblemEmailHint {
    return Intl.message(
      'Enter your email if you\'d like a follow-up',
      name: 'reportProblemEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get reportProblemEmailInvalid {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'reportProblemEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Your comments`
  String get reportProblemCommentLabel {
    return Intl.message(
      'Your comments',
      name: 'reportProblemCommentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Political Contributions 2024`
  String get politicalContributionsTitle {
    return Intl.message(
      'Political Contributions 2024',
      name: 'politicalContributionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get editContributionsButtonLabel {
    return Intl.message(
      'Edit',
      name: 'editContributionsButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `No political contributions yet.`
  String get noPoliticalContributionsYet {
    return Intl.message(
      'No political contributions yet.',
      name: 'noPoliticalContributionsYet',
      desc: '',
      args: [],
    );
  }

  /// `Democrats`
  String get democratsLabel {
    return Intl.message(
      'Democrats',
      name: 'democratsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Republicans`
  String get republicansLabel {
    return Intl.message(
      'Republicans',
      name: 'republicansLabel',
      desc: '',
      args: [],
    );
  }

  /// `Alternatives`
  String get alternativesLabel {
    return Intl.message(
      'Alternatives',
      name: 'alternativesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Propose an alternative`
  String get proposeAlternativeHint {
    return Intl.message(
      'Propose an alternative',
      name: 'proposeAlternativeHint',
      desc: '',
      args: [],
    );
  }

  /// `Thank you! Your alternative has been submitted for review and will be processed within 48 hours.`
  String get alternativeSubmittedMessage {
    return Intl.message(
      'Thank you! Your alternative has been submitted for review and will be processed within 48 hours.',
      name: 'alternativeSubmittedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error sending: {error}`
  String alternativeSubmitErrorMessage(Object error) {
    return Intl.message(
      'Error sending: $error',
      name: 'alternativeSubmitErrorMessage',
      desc: '',
      args: [error],
    );
  }

  /// `No alternatives yet.`
  String get noAlternativesYet {
    return Intl.message(
      'No alternatives yet.',
      name: 'noAlternativesYet',
      desc: '',
      args: [],
    );
  }

  /// `Edit the political contributions for the American presidency election 2024`
  String get editContributionsSubtitle {
    return Intl.message(
      'Edit the political contributions for the American presidency election 2024',
      name: 'editContributionsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `You can find the contribution amounts for the 2024 US election on the Open Secret website.`
  String get contributionsInfoText {
    return Intl.message(
      'You can find the contribution amounts for the 2024 US election on the Open Secret website.',
      name: 'contributionsInfoText',
      desc: '',
      args: [],
    );
  }

  /// `Democrat Contributions`
  String get democratContributionsLabel {
    return Intl.message(
      'Democrat Contributions',
      name: 'democratContributionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Amount (Democrats)`
  String get democratContributionsHint {
    return Intl.message(
      'Amount (Democrats)',
      name: 'democratContributionsHint',
      desc: '',
      args: [],
    );
  }

  /// `Republican Contributions`
  String get republicanContributionsLabel {
    return Intl.message(
      'Republican Contributions',
      name: 'republicanContributionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Amount (Republicans)`
  String get republicanContributionsHint {
    return Intl.message(
      'Amount (Republicans)',
      name: 'republicanContributionsHint',
      desc: '',
      args: [],
    );
  }

  /// `Save Contributions`
  String get saveContributionsButton {
    return Intl.message(
      'Save Contributions',
      name: 'saveContributionsButton',
      desc: '',
      args: [],
    );
  }

  /// `Saving contributions...`
  String get savingContributions {
    return Intl.message(
      'Saving contributions...',
      name: 'savingContributions',
      desc: '',
      args: [],
    );
  }

  /// `Thank you! Your contributions have been submitted for review and will be processed within 48 hours.`
  String get contributionsSavedSuccess {
    return Intl.message(
      'Thank you! Your contributions have been submitted for review and will be processed within 48 hours.',
      name: 'contributionsSavedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error saving contributions.`
  String get contributionsSaveError {
    return Intl.message(
      'Error saving contributions.',
      name: 'contributionsSaveError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number.`
  String get invalidNumberError {
    return Intl.message(
      'Please enter a valid number.',
      name: 'invalidNumberError',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get okButtonLabel {
    return Intl.message('OK', name: 'okButtonLabel', desc: '', args: []);
  }

  /// `Origin of Ingredients`
  String get originOfIngredients {
    return Intl.message(
      'Origin of Ingredients',
      name: 'originOfIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Select country/countries...`
  String get selectCountry {
    return Intl.message(
      'Select country/countries...',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Please select a photo for the ingredients.`
  String get selectIngredientPhotoError {
    return Intl.message(
      'Please select a photo for the ingredients.',
      name: 'selectIngredientPhotoError',
      desc: '',
      args: [],
    );
  }

  /// `Please select a photo for the nutrition table.`
  String get selectNutritionPhotoError {
    return Intl.message(
      'Please select a photo for the nutrition table.',
      name: 'selectNutritionPhotoError',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients photo upload failed: {details}`
  String ingredientPhotoUploadFailed(Object details) {
    return Intl.message(
      'Ingredients photo upload failed: $details',
      name: 'ingredientPhotoUploadFailed',
      desc: '',
      args: [details],
    );
  }

  /// `Nutrition photo upload failed: {details}`
  String nutritionPhotoUploadFailed(Object details) {
    return Intl.message(
      'Nutrition photo upload failed: $details',
      name: 'nutritionPhotoUploadFailed',
      desc: '',
      args: [details],
    );
  }

  /// `However`
  String get however {
    return Intl.message('However', name: 'however', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Nutrition Fact`
  String get nutritionTablePhoto {
    return Intl.message(
      'Nutrition Fact',
      name: 'nutritionTablePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients (optional)`
  String get ingredientsOptional {
    return Intl.message(
      'Ingredients (optional)',
      name: 'ingredientsOptional',
      desc: '',
      args: [],
    );
  }

  /// `Select origin countries`
  String get selectOriginCountries {
    return Intl.message(
      'Select origin countries',
      name: 'selectOriginCountries',
      desc: '',
      args: [],
    );
  }

  /// `Origin Countries`
  String get countrySelectionScreenTitle {
    return Intl.message(
      'Origin Countries',
      name: 'countrySelectionScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search for a country`
  String get searchCountryPlaceholder {
    return Intl.message(
      'Search for a country',
      name: 'searchCountryPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message('Settings', name: 'settingsTitle', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Language selection`
  String get languageSelection {
    return Intl.message(
      'Language selection',
      name: 'languageSelection',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message('Preferences', name: 'preferences', desc: '', args: []);
  }

  /// `Contribution`
  String get contribution {
    return Intl.message(
      'Contribution',
      name: 'contribution',
      desc: '',
      args: [],
    );
  }

  /// `Enable contributor mode`
  String get enableContributorMode {
    return Intl.message(
      'Enable contributor mode',
      name: 'enableContributorMode',
      desc: '',
      args: [],
    );
  }

  /// `More info on contributor mode`
  String get contributorModeInfo {
    return Intl.message(
      'More info on contributor mode',
      name: 'contributorModeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Support & Community`
  String get supportCommunity {
    return Intl.message(
      'Support & Community',
      name: 'supportCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Visit our website`
  String get visitWebsite {
    return Intl.message(
      'Visit our website',
      name: 'visitWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Unable to open link`
  String get unableToOpenLink {
    return Intl.message(
      'Unable to open link',
      name: 'unableToOpenLink',
      desc: '',
      args: [],
    );
  }

  /// `Follow us on Instagram`
  String get followUsOnInstagram {
    return Intl.message(
      'Follow us on Instagram',
      name: 'followUsOnInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Unable to open Instagram`
  String get unableToOpenInstagram {
    return Intl.message(
      'Unable to open Instagram',
      name: 'unableToOpenInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Report a problem`
  String get reportProblem {
    return Intl.message(
      'Report a problem',
      name: 'reportProblem',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferencesScreenTitle {
    return Intl.message(
      'Preferences',
      name: 'preferencesScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Display`
  String get display {
    return Intl.message('Display', name: 'display', desc: '', args: []);
  }

  /// `Show Trump’s head`
  String get showTrumpHead {
    return Intl.message(
      'Show Trump’s head',
      name: 'showTrumpHead',
      desc: '',
      args: [],
    );
  }

  /// `Counter`
  String get counter {
    return Intl.message('Counter', name: 'counter', desc: '', args: []);
  }

  /// `Reset counter`
  String get resetCounter {
    return Intl.message(
      'Reset counter',
      name: 'resetCounter',
      desc: '',
      args: [],
    );
  }

  /// `Counter reset successfully`
  String get counterResetSuccess {
    return Intl.message(
      'Counter reset successfully',
      name: 'counterResetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Scores reset successfully`
  String get scoresResetSuccess {
    return Intl.message(
      'Scores reset successfully',
      name: 'scoresResetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get mode {
    return Intl.message('Mode', name: 'mode', desc: '', args: []);
  }

  /// `Enable boycott mode`
  String get enableBoycottMode {
    return Intl.message(
      'Enable boycott mode',
      name: 'enableBoycottMode',
      desc: '',
      args: [],
    );
  }

  /// `Consider as American if linked to the USA`
  String get considerAsAmericanIfLinkedToUSA {
    return Intl.message(
      'Consider as American if linked to the USA',
      name: 'considerAsAmericanIfLinkedToUSA',
      desc: '',
      args: [],
    );
  }

  /// `x`
  String get xPrefix {
    return Intl.message('x', name: 'xPrefix', desc: '', args: []);
  }

  /// `Information`
  String get informationTitle {
    return Intl.message(
      'Information',
      name: 'informationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Product`
  String get fallbackProduct {
    return Intl.message('Product', name: 'fallbackProduct', desc: '', args: []);
  }

  /// `Options`
  String get optionsTitle {
    return Intl.message('Options', name: 'optionsTitle', desc: '', args: []);
  }

  /// `USA Counter`
  String get counterTitle {
    return Intl.message(
      'USA Counter',
      name: 'counterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get resetButton {
    return Intl.message('Reset', name: 'resetButton', desc: '', args: []);
  }

  /// `Scores reset successfully.`
  String get resetSuccessSnack {
    return Intl.message(
      'Scores reset successfully.',
      name: 'resetSuccessSnack',
      desc: '',
      args: [],
    );
  }

  /// `No information available`
  String get noInfo {
    return Intl.message(
      'No information available',
      name: 'noInfo',
      desc: '',
      args: [],
    );
  }

  /// `Defects`
  String get defectsTitle {
    return Intl.message('Defects', name: 'defectsTitle', desc: '', args: []);
  }

  /// `Qualities`
  String get qualitiesTitle {
    return Intl.message(
      'Qualities',
      name: 'qualitiesTitle',
      desc: '',
      args: [],
    );
  }

  /// `No health information available`
  String get noHealthInfo {
    return Intl.message(
      'No health information available',
      name: 'noHealthInfo',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get healthLabel {
    return Intl.message('Health', name: 'healthLabel', desc: '', args: []);
  }

  /// `N/A`
  String get naLabel {
    return Intl.message('N/A', name: 'naLabel', desc: '', args: []);
  }

  /// `{value} g`
  String gramsValue(Object value) {
    return Intl.message(
      '$value g',
      name: 'gramsValue',
      desc: '',
      args: [value],
    );
  }

  /// `{value} kcal`
  String kcalValue(Object value) {
    return Intl.message(
      '$value kcal',
      name: 'kcalValue',
      desc: '',
      args: [value],
    );
  }

  /// `Sugars`
  String get sugarsTitle {
    return Intl.message('Sugars', name: 'sugarsTitle', desc: '', args: []);
  }

  /// `Low in sugars`
  String get sugarsLow {
    return Intl.message('Low in sugars', name: 'sugarsLow', desc: '', args: []);
  }

  /// `Moderate sugars`
  String get sugarsMedium {
    return Intl.message(
      'Moderate sugars',
      name: 'sugarsMedium',
      desc: '',
      args: [],
    );
  }

  /// `Too sugary`
  String get sugarsHigh {
    return Intl.message('Too sugary', name: 'sugarsHigh', desc: '', args: []);
  }

  /// `Data unavailable`
  String get unknownData {
    return Intl.message(
      'Data unavailable',
      name: 'unknownData',
      desc: '',
      args: [],
    );
  }

  /// `Salt`
  String get saltTitle {
    return Intl.message('Salt', name: 'saltTitle', desc: '', args: []);
  }

  /// `Low in salt`
  String get saltLow {
    return Intl.message('Low in salt', name: 'saltLow', desc: '', args: []);
  }

  /// `Moderate salt`
  String get saltMedium {
    return Intl.message(
      'Moderate salt',
      name: 'saltMedium',
      desc: '',
      args: [],
    );
  }

  /// `Too salty`
  String get saltHigh {
    return Intl.message('Too salty', name: 'saltHigh', desc: '', args: []);
  }

  /// `Fats`
  String get fatTitle {
    return Intl.message('Fats', name: 'fatTitle', desc: '', args: []);
  }

  /// `Low fat`
  String get fatLow {
    return Intl.message('Low fat', name: 'fatLow', desc: '', args: []);
  }

  /// `Moderate fat`
  String get fatMedium {
    return Intl.message('Moderate fat', name: 'fatMedium', desc: '', args: []);
  }

  /// `High fat`
  String get fatHigh {
    return Intl.message('High fat', name: 'fatHigh', desc: '', args: []);
  }

  /// `Saturated fats`
  String get saturatedFatTitle {
    return Intl.message(
      'Saturated fats',
      name: 'saturatedFatTitle',
      desc: '',
      args: [],
    );
  }

  /// `Low in saturated fat`
  String get saturatedFatLow {
    return Intl.message(
      'Low in saturated fat',
      name: 'saturatedFatLow',
      desc: '',
      args: [],
    );
  }

  /// `Moderate saturated fats`
  String get saturatedFatMedium {
    return Intl.message(
      'Moderate saturated fats',
      name: 'saturatedFatMedium',
      desc: '',
      args: [],
    );
  }

  /// `Too much saturated fat`
  String get saturatedFatHigh {
    return Intl.message(
      'Too much saturated fat',
      name: 'saturatedFatHigh',
      desc: '',
      args: [],
    );
  }

  /// `Fiber`
  String get fiberTitle {
    return Intl.message('Fiber', name: 'fiberTitle', desc: '', args: []);
  }

  /// `Low in fiber`
  String get fiberLow {
    return Intl.message('Low in fiber', name: 'fiberLow', desc: '', args: []);
  }

  /// `Some fiber`
  String get fiberMedium {
    return Intl.message('Some fiber', name: 'fiberMedium', desc: '', args: []);
  }

  /// `High in fiber`
  String get fiberHigh {
    return Intl.message('High in fiber', name: 'fiberHigh', desc: '', args: []);
  }

  /// `Proteins`
  String get proteinsTitle {
    return Intl.message('Proteins', name: 'proteinsTitle', desc: '', args: []);
  }

  /// `Low in protein`
  String get proteinsLow {
    return Intl.message(
      'Low in protein',
      name: 'proteinsLow',
      desc: '',
      args: [],
    );
  }

  /// `Some protein`
  String get proteinsMedium {
    return Intl.message(
      'Some protein',
      name: 'proteinsMedium',
      desc: '',
      args: [],
    );
  }

  /// `High in protein`
  String get proteinsHigh {
    return Intl.message(
      'High in protein',
      name: 'proteinsHigh',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get energyTitle {
    return Intl.message('Calories', name: 'energyTitle', desc: '', args: []);
  }

  /// `Low caloric impact`
  String get energyLow {
    return Intl.message(
      'Low caloric impact',
      name: 'energyLow',
      desc: '',
      args: [],
    );
  }

  /// `Moderate caloric intake`
  String get energyMedium {
    return Intl.message(
      'Moderate caloric intake',
      name: 'energyMedium',
      desc: '',
      args: [],
    );
  }

  /// `Calorie-dense`
  String get energyHigh {
    return Intl.message(
      'Calorie-dense',
      name: 'energyHigh',
      desc: '',
      args: [],
    );
  }

  /// `NOVA Group`
  String get novaGroupTitle {
    return Intl.message(
      'NOVA Group',
      name: 'novaGroupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Group {group}`
  String novaGroupAdditional(Object group) {
    return Intl.message(
      'Group $group',
      name: 'novaGroupAdditional',
      desc: '',
      args: [group],
    );
  }

  /// `Unprocessed or minimally processed foods`
  String get novaGroup1Desc {
    return Intl.message(
      'Unprocessed or minimally processed foods',
      name: 'novaGroup1Desc',
      desc: '',
      args: [],
    );
  }

  /// `Processed culinary ingredients`
  String get novaGroup2Desc {
    return Intl.message(
      'Processed culinary ingredients',
      name: 'novaGroup2Desc',
      desc: '',
      args: [],
    );
  }

  /// `Processed foods`
  String get novaGroup3Desc {
    return Intl.message(
      'Processed foods',
      name: 'novaGroup3Desc',
      desc: '',
      args: [],
    );
  }

  /// `Ultra-processed products`
  String get novaGroup4Desc {
    return Intl.message(
      'Ultra-processed products',
      name: 'novaGroup4Desc',
      desc: '',
      args: [],
    );
  }

  /// `Unknown group`
  String get novaGroupUnknown {
    return Intl.message(
      'Unknown group',
      name: 'novaGroupUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Organic`
  String get organicTitle {
    return Intl.message('Organic', name: 'organicTitle', desc: '', args: []);
  }

  /// `Organic product`
  String get organicYes {
    return Intl.message(
      'Organic product',
      name: 'organicYes',
      desc: '',
      args: [],
    );
  }

  /// `Not organic`
  String get organicNo {
    return Intl.message('Not organic', name: 'organicNo', desc: '', args: []);
  }

  /// `Additives`
  String get additivesTitle {
    return Intl.message(
      'Additives',
      name: 'additivesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Allergens`
  String get allergensTitle {
    return Intl.message(
      'Allergens',
      name: 'allergensTitle',
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
      Locale.fromSubtags(languageCode: 'da'),
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
