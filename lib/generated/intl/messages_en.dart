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

  static String m1(statusCode) =>
      "Failed to send text information (status ${statusCode}). Check logs for HTML response.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Click here to complete the info",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("Add information"),
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
      "Thank you! Product information added.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Add information",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage("Add a product"),
    "alimentation": MessageLookupByLibrary.simpleMessage("Food"),
    "alimentationAnimaux": MessageLookupByLibrary.simpleMessage("Pet food"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scan your product\'s barcode to find out if the brand is owned by an American company.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan Barcode"),
    "autre": MessageLookupByLibrary.simpleMessage("Other"),
    "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Barcode: "),
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
    "cosmetique": MessageLookupByLibrary.simpleMessage("Cosmetic"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Short product description",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Description *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "This brand is not present in our database.",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "An error occurred while adding the product.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Error"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "This field is required.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in all fields.",
    ),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
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
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter a food brand",
    ),
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
      "Country of origin (Optional)",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Photo"),
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
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Click here to report an issue",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Report a problem",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Describe the problem encountered with the product or application.",
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
      "Thank you! Your report has been sent.",
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
    "safe": MessageLookupByLibrary.simpleMessage("NOT USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product does not seem to come from an American company.",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Make sure to enter a correctly spelled food brand to avoid errors.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage("Select a category"),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Please select a category.",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Please select a photo.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Sending image..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Sending information...",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Source not found"),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Error during submission.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Product added successfully!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Success"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Text information was sent, but image upload failed.",
    ),
    "textSubmissionFailed": m1,
    "unknown": MessageLookupByLibrary.simpleMessage("UNKNOWN"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "The product you searched for was not found in our database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product comes from an American company!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validate"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("View criteria"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome to"),
  };
}
