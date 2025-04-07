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
      "Scansiona il codice a barre del tuo prodotto per scoprire se il marchio appartiene a un\'azienda americana.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Scansiona il codice a barre",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marchio non trovato",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Questo marchio non è presente nel nostro database di marchi americani.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Inserisci una marca alimentare",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Non siamo perfetti e potremmo non aver ancora identificato tutti i marchi. Tuttavia, il nostro database include già oltre 400 marchi alimentari. Se trovi un prodotto proveniente dagli Stati Uniti che non è elencato, inviaci un\'email con il nome del marchio in modo da poter aggiornare la nostra lista. Da soli andiamo veloci, ma insieme possiamo andare oltre.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problema con un prodotto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Prodotto non trovato",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NON USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Questo prodotto non sembra provenire da un\'azienda americana.",
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
