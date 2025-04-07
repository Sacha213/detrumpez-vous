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
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scannez le code-barres de votre produit pour découvrir si la marque est détenue par une entreprise américaine.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scannez le code-barres"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Marque non trouvée"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Cette marque n\'est pas présente dans notre base de données de marques américaines.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez une marque alimentaire",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Nous ne sommes pas parfaits et il se peut que nous n’ayons pas encore identifié toutes les marques. Cependant, notre base de données compte déjà plus de 400 marques alimentaires. Si vous tombez sur un produit issu des États-Unis qui n’est pas répertorié, merci de nous envoyer un e-mail avec le nom de la marque afin que nous puissions mettre à jour notre liste. Seuls, nous avançons vite, mais ensemble, nous allons plus loin.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Un problème avec un produit ?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produit non trouvé",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NON USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Ce produit ne semble pas provenir d\'une entreprise américaine.",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Source non trouvée",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("INCONNU"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Le produit que vous avez recherché n\'a pas été trouvé dans notre base de données.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Ce produit provient d\'une entreprise américaine !",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Valider"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bienvenue dans"),
  };
}
