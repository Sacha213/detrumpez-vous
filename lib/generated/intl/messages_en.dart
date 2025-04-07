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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scan your product\'s barcode to discover if the brand is owned by an American company.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan the barcode"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Brand not found"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "This brand is not in our American brand database.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter a grocery brand",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "We are not perfect and may not have identified every brand yet. However, our database already includes over 400 food brands. If you come across a product from the United States that isn’t listed, please send us an email with the brand name so we can update our list. Alone we move fast, but together we can go further.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problem with a product?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Product not found",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NOT USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product does not appear to be from an American company.",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Source not found"),
    "unknown": MessageLookupByLibrary.simpleMessage("UNKNOWN"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "The product you searched for was not found in our database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product is from an American company!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validate"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome in"),
  };
}
