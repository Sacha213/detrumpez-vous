// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scannen Sie den Barcode Ihres Produkts, um herauszufinden, ob die Marke einem amerikanischen Unternehmen gehört.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Barcode scannen"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marke nicht gefunden",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Diese Marke ist nicht in unserer US-basierten Markendatenbank vorhanden.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Geben Sie eine Lebensmittelmarke ein",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Wenn Sie ein Produkt aus den USA identifiziert haben, melden Sie es bitte, damit wir es zu unserer Liste hinzufügen können.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problem mit einem Produkt?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produkt nicht gefunden",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NICHT USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dieses Produkt stammt nicht von einem US-Unternehmen!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Quelle nicht gefunden",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("UNBEKANNT"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Das gesuchte Produkt wurde in unserer Datenbank nicht gefunden.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dieses Produkt stammt von einem US-Unternehmen!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Bestätigen"),
    "welcome": MessageLookupByLibrary.simpleMessage("Willkommen in"),
  };
}
