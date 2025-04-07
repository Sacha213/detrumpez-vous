// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl locale. All the
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
  String get localeName => 'nl';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scan de barcode van uw product om te ontdekken of het merk eigendom is van een Amerikaans bedrijf.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan de barcode"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Merk niet gevonden"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuleren"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Dit merk is niet opgenomen in onze Amerikaanse merkdatabase.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Voer een levensmiddelenmerk in",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Wij zijn niet perfect en hebben mogelijk nog niet elk merk geïdentificeerd. Onze database bevat echter al meer dan 400 voedingsmerken. Als u een product uit de Verenigde Staten tegenkomt dat niet vermeld staat, stuur ons dan een e-mail met de merknaam zodat we onze lijst kunnen bijwerken. Alleen gaan we snel, maar samen komen we verder.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Probleem met een product?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Product niet gevonden",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NIET USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dit product lijkt niet afkomstig te zijn van een Amerikaans bedrijf.",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Bron niet gevonden",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("ONBEKEND"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Het product waarnaar u zocht is niet in onze database gevonden.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dit product behoort tot een Amerikaans bedrijf!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Bevestigen"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welkom in"),
  };
}
