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
      "Scansiona il codice a barre del tuo prodotto alimentare per scoprire se la marca è di proprietà di un\'azienda statunitense.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Scansiona un Prodotto Alimentare",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Marca sconosciuta"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Descrizione non trovata",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Se hai identificato un prodotto dagli Stati Uniti, segnalalo affinché possiamo aggiungerlo alla nostra lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problema con un prodotto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Prodotto non trovato",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SICURO"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Questo prodotto non proviene da una società americana!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Fonte sconosciuta"),
    "unknown": MessageLookupByLibrary.simpleMessage("SCONOSCIUTO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Il prodotto cercato non è stato trovato nel nostro database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Questo prodotto proviene da una società americana!",
    ),
    "welcome": MessageLookupByLibrary.simpleMessage("Benvenuto in"),
  };
}
