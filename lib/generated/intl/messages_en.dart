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
      "Scan your food product barcode to discover if the brand is owned by a U.S. company.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan a Food Product"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Unknown brand"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Description not found",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "If you have identified a product from the United States, please report it so we can add it to our list.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problem with a product?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Product not found",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SAFE"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product is not from an American company!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Unknown source"),
    "unknown": MessageLookupByLibrary.simpleMessage("UNKNOWN"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "The searched product was not found in our database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "This product is from an American company!",
    ),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome in"),
  };
}
