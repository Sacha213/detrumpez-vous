// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(barcode) =>
      "Provide missing details for barcode: ${barcode}";

  static String m1(error) => "Error sending: ${error}";

  static String m2(value) => "${value} g";

  static String m3(details) => "Ingredients photo upload failed: ${details}";

  static String m4(value) => "${value} kcal";

  static String m5(group) => "Group ${group}";

  static String m6(details) => "Nutrition photo upload failed: ${details}";

  static String m7(statusCode) =>
      "Failed to send text information (status ${statusCode}). Check logs for HTML response.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Click here to complete the info",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("Add information"),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Add ingredient photo",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Add a photo"),
    "addProductButton": MessageLookupByLibrary.simpleMessage("Add product"),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Help us by adding a product to the database",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Add information",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Error sending information. Please try again.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Complete product information",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Thank you! Your product information has been submitted for review and will be added within 48 hours.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Add information",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage("Add a product"),
    "additivesTitle": MessageLookupByLibrary.simpleMessage("Additives"),
    "allergensTitle": MessageLookupByLibrary.simpleMessage("Allergens"),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "Thank you! Your alternative has been submitted for review and will be processed within 48 hours.",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Alternatives"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scan your product\'s barcode to find out if the brand is owned by an American company.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan Barcode"),
    "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Barcode: "),
    "beauty": MessageLookupByLibrary.simpleMessage("Beauty"),
    "brandHint": MessageLookupByLibrary.simpleMessage("Main brand name"),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Brand *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Brand name"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ex: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Brand not found"),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Click here to discover our criteria",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "How are companies classified?",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "A brand is considered American if it belongs to an American group.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "American Company Criteria",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Company"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s is an American brand but was acquired by Unilever (an Anglo-Dutch multinational) in 2000. Thus, the brand is not considered American.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné is a French brand but was acquired by the American group McCormick in 2000. Thus, the brand is considered American.",
    ),
    "considerAsAmericanIfLinkedToUSA": MessageLookupByLibrary.simpleMessage(
      "Consider as American if linked to the USA",
    ),
    "contribution": MessageLookupByLibrary.simpleMessage("Contribution"),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "You can find the contribution amounts for the 2024 US election on the Open Secret website.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Error saving contributions.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Thank you! Your contributions have been submitted for review and will be processed within 48 hours.",
    ),
    "contributorModeInfo": MessageLookupByLibrary.simpleMessage(
      "More info on contributor mode",
    ),
    "counter": MessageLookupByLibrary.simpleMessage("Counter"),
    "counterResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Counter reset successfully",
    ),
    "counterTitle": MessageLookupByLibrary.simpleMessage("USA Counter"),
    "countrySelectionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Origin Countries",
    ),
    "defectsTitle": MessageLookupByLibrary.simpleMessage("Defects"),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Amount (Democrats)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Democrat Contributions",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Democrats"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Short product description",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Description *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "This brand is not present in our database.",
    ),
    "display": MessageLookupByLibrary.simpleMessage("Display"),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Edit",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Edit the political contributions for the American presidency election 2024",
    ),
    "enableBoycottMode": MessageLookupByLibrary.simpleMessage(
      "Enable boycott mode",
    ),
    "enableContributorMode": MessageLookupByLibrary.simpleMessage(
      "Enable contributor mode",
    ),
    "energyHigh": MessageLookupByLibrary.simpleMessage("Calorie-dense"),
    "energyLow": MessageLookupByLibrary.simpleMessage("Low caloric impact"),
    "energyMedium": MessageLookupByLibrary.simpleMessage(
      "Moderate caloric intake",
    ),
    "energyTitle": MessageLookupByLibrary.simpleMessage("Calories"),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "An error occurred while adding the product.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Error"),
    "fallbackProduct": MessageLookupByLibrary.simpleMessage("Product"),
    "fatHigh": MessageLookupByLibrary.simpleMessage("High fat"),
    "fatLow": MessageLookupByLibrary.simpleMessage("Low fat"),
    "fatMedium": MessageLookupByLibrary.simpleMessage("Moderate fat"),
    "fatTitle": MessageLookupByLibrary.simpleMessage("Fats"),
    "fiberHigh": MessageLookupByLibrary.simpleMessage("High in fiber"),
    "fiberLow": MessageLookupByLibrary.simpleMessage("Low in fiber"),
    "fiberMedium": MessageLookupByLibrary.simpleMessage("Some fiber"),
    "fiberTitle": MessageLookupByLibrary.simpleMessage("Fiber"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "This field is required.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in all fields.",
    ),
    "followUsOnInstagram": MessageLookupByLibrary.simpleMessage(
      "Follow us on Instagram",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Food"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "gramsValue": m2,
    "healthLabel": MessageLookupByLibrary.simpleMessage("Health"),
    "however": MessageLookupByLibrary.simpleMessage("However"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Error selecting image",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage(
      "Choose a source",
    ),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("Image source"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Error uploading image.",
    ),
    "informationTitle": MessageLookupByLibrary.simpleMessage("Information"),
    "ingredientPhotoUploadFailed": m3,
    "ingredientsOptional": MessageLookupByLibrary.simpleMessage(
      "Ingredients (optional)",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Ingredients origin",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid number.",
    ),
    "kcalValue": m4,
    "languageSelection": MessageLookupByLibrary.simpleMessage(
      "Language selection",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter a brand",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Mode"),
    "naLabel": MessageLookupByLibrary.simpleMessage("N/A"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "No alternatives yet.",
    ),
    "noHealthInfo": MessageLookupByLibrary.simpleMessage(
      "No health information available",
    ),
    "noInfo": MessageLookupByLibrary.simpleMessage("No information available"),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "No political contributions yet.",
    ),
    "novaGroup1Desc": MessageLookupByLibrary.simpleMessage(
      "Unprocessed or minimally processed foods",
    ),
    "novaGroup2Desc": MessageLookupByLibrary.simpleMessage(
      "Processed culinary ingredients",
    ),
    "novaGroup3Desc": MessageLookupByLibrary.simpleMessage("Processed foods"),
    "novaGroup4Desc": MessageLookupByLibrary.simpleMessage(
      "Ultra-processed products",
    ),
    "novaGroupAdditional": m5,
    "novaGroupTitle": MessageLookupByLibrary.simpleMessage("NOVA Group"),
    "novaGroupUnknown": MessageLookupByLibrary.simpleMessage("Unknown group"),
    "nutritionPhotoUploadFailed": m6,
    "nutritionTablePhoto": MessageLookupByLibrary.simpleMessage(
      "Nutrition Fact",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "optionsTitle": MessageLookupByLibrary.simpleMessage("Options"),
    "organicNo": MessageLookupByLibrary.simpleMessage("Not organic"),
    "organicTitle": MessageLookupByLibrary.simpleMessage("Organic"),
    "organicYes": MessageLookupByLibrary.simpleMessage("Organic product"),
    "originLabel": MessageLookupByLibrary.simpleMessage("Country of origin"),
    "originOfIngredients": MessageLookupByLibrary.simpleMessage(
      "Origin of Ingredients",
    ),
    "other": MessageLookupByLibrary.simpleMessage("Other"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Name of the owning company",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage(
      "Parent company",
    ),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Parent company (Optional)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Ex: France, USA, China...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Parent company\'s country of origin (Optional)",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("Pet food"),
    "photo": MessageLookupByLibrary.simpleMessage("Photo"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Political Contributions 2024",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferences"),
    "preferencesScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Preferences",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "We can make mistakes. If you spot one, please email us the brand name so we can update our list.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "A problem with a product?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Product and image added successfully!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Product name"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the product name",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Product not found",
    ),
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Propose an alternative",
    ),
    "proteinsHigh": MessageLookupByLibrary.simpleMessage("High in protein"),
    "proteinsLow": MessageLookupByLibrary.simpleMessage("Low in protein"),
    "proteinsMedium": MessageLookupByLibrary.simpleMessage("Some protein"),
    "proteinsTitle": MessageLookupByLibrary.simpleMessage("Proteins"),
    "qualitiesTitle": MessageLookupByLibrary.simpleMessage("Qualities"),
    "reportProblem": MessageLookupByLibrary.simpleMessage("Report a problem"),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Click here to report an issue",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Report a problem",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Your comments",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Describe the problem encountered with the product or application.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Enter your email if you\'d like a follow-up",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Your Email (Optional)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Error sending report. Please try again.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Help us improve the application",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Describe the problem or error...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Send report",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Thank you! Your report has been submitted for review and will be processed within 48 hours.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Report a problem",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Please describe the problem.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Please provide more details (10 characters min).",
    ),
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Amount (Republicans)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Republican Contributions",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Republicans"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetButton": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetCounter": MessageLookupByLibrary.simpleMessage("Reset counter"),
    "resetSuccessSnack": MessageLookupByLibrary.simpleMessage(
      "Scores reset successfully.",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NOT USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product does not seem to come from an American company.",
    ),
    "saltHigh": MessageLookupByLibrary.simpleMessage("Too salty"),
    "saltLow": MessageLookupByLibrary.simpleMessage("Low in salt"),
    "saltMedium": MessageLookupByLibrary.simpleMessage("Moderate salt"),
    "saltTitle": MessageLookupByLibrary.simpleMessage("Salt"),
    "saturatedFatHigh": MessageLookupByLibrary.simpleMessage(
      "Too much saturated fat",
    ),
    "saturatedFatLow": MessageLookupByLibrary.simpleMessage(
      "Low in saturated fat",
    ),
    "saturatedFatMedium": MessageLookupByLibrary.simpleMessage(
      "Moderate saturated fats",
    ),
    "saturatedFatTitle": MessageLookupByLibrary.simpleMessage("Saturated fats"),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Save Contributions",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Saving contributions...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage("Scan a barcode"),
    "scoresResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Scores reset successfully",
    ),
    "searchCountryPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Search for a country",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Make sure to enter a correctly spelled food brand to avoid errors.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage("Select a category"),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Please select a category.",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "Select country/countries...",
    ),
    "selectIngredientPhotoError": MessageLookupByLibrary.simpleMessage(
      "Please select a photo for the ingredients.",
    ),
    "selectNutritionPhotoError": MessageLookupByLibrary.simpleMessage(
      "Please select a photo for the nutrition table.",
    ),
    "selectOriginCountries": MessageLookupByLibrary.simpleMessage(
      "Select origin countries",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Please select a photo.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Sending image..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Sending information...",
    ),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Settings"),
    "showTrumpHead": MessageLookupByLibrary.simpleMessage("Show Trump’s head"),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Source not found"),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Error during submission.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Product added successfully!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Success"),
    "sugarsHigh": MessageLookupByLibrary.simpleMessage("Too sugary"),
    "sugarsLow": MessageLookupByLibrary.simpleMessage("Low in sugars"),
    "sugarsMedium": MessageLookupByLibrary.simpleMessage("Moderate sugars"),
    "sugarsTitle": MessageLookupByLibrary.simpleMessage("Sugars"),
    "supportCommunity": MessageLookupByLibrary.simpleMessage(
      "Support & Community",
    ),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Text information was sent, but image upload failed.",
    ),
    "textSubmissionFailed": m7,
    "unableToOpenInstagram": MessageLookupByLibrary.simpleMessage(
      "Unable to open Instagram",
    ),
    "unableToOpenLink": MessageLookupByLibrary.simpleMessage(
      "Unable to open link",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("UNKNOWN"),
    "unknownData": MessageLookupByLibrary.simpleMessage("Data unavailable"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "The product you searched for was not found in our database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product comes from an American company!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validate"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("View criteria"),
    "visitWebsite": MessageLookupByLibrary.simpleMessage("Visit our website"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome to"),
    "xPrefix": MessageLookupByLibrary.simpleMessage("x"),
  };
}
