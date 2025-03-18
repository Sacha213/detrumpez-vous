// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scansiona il codice a barre del tuo prodotto per scoprire se il marchio è di proprietà di un\'azienda americana.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scansiona un prodotto"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marchio non trovato",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Descrizione non trovata",
    ),
    "manualBrandContent": MessageLookupByLibrary.simpleMessage(
      "Inserisci il marchio del prodotto",
    ),
    "manualBrandPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Inserisci il marchio",
    ),
    "manualBrandTitle": MessageLookupByLibrary.simpleMessage(
      "Marchio non trovato",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Se hai identificato un prodotto degli Stati Uniti, segnalacelo in modo che possiamo aggiungerlo alla nostra lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problema con un prodotto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Prodotto non trovato",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SAFE"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Questo prodotto non proviene da un\'azienda americana!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Fonte non trovata"),
    "unknown": MessageLookupByLibrary.simpleMessage("Sconosciuto"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Il prodotto cercato non è stato trovato nel nostro database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Questo prodotto proviene da un\'azienda americana!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Conferma"),
    "welcome": MessageLookupByLibrary.simpleMessage("Benvenuto in"),
  };
}
