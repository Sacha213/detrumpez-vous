// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Scannez un produit alimentaire",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Marque inconnue"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Description non trouvé",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Si vous avez identifié un produit venant des États-Unis, n\'hésitez pas à nous le signaler pour que nous puissions l\'ajouter à notre liste.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Un problème avec un produit ?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produit non trouvé",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SAFE"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Ce produit ne vient pas d\'une entreprise américaine !",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Source inconnue"),
    "unknown": MessageLookupByLibrary.simpleMessage("INCONNU"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Le produit recherché n\'a pas été trouvé dans notre base de données.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Ce produit vient d\'une entreprise américaine !",
    ),
  };
}
