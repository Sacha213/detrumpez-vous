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
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Eine Marke gilt als amerikanisch, wenn sie zu einem amerikanischen Konzern gehört.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Kriterien für amerikanische Unternehmen",
    ),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s ist eine amerikanische Marke, wurde jedoch 2000 von Unilever (einem anglo-niederländischen multinationalen Unternehmen) übernommen. Daher gilt die Marke nicht als amerikanisch.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné ist eine französische Marke, wurde jedoch 2000 von der amerikanischen Firma McCormick übernommen. Daher gilt die Marke als amerikanisch.",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Diese Marke ist nicht in unserer US-basierten Markendatenbank vorhanden.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Geben Sie eine Lebensmittelmarke ein",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Unsere Datenbank enthält bereits über 300 Marken, aber einige müssen noch identifiziert werden. Wenn Sie ein amerikanisches Produkt entdecken, das nicht aufgeführt ist, senden Sie uns bitte eine E-Mail mit dem Markennamen, damit wir unsere Liste aktualisieren können.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problem mit einem Produkt?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produkt nicht gefunden",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NICHT USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dieses Produkt scheint nicht von einem amerikanischen Unternehmen zu stammen.",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Bitte geben Sie eine korrekt geschriebene Lebensmittelmarke ein, um Fehler zu vermeiden.",
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
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Kriterien anzeigen"),
    "welcome": MessageLookupByLibrary.simpleMessage("Willkommen in"),
  };
}
