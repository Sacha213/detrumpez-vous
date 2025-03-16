// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Escanea un producto alimenticio",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Marca desconocida"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Descripción no encontrada",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Si ha identificado un producto de los Estados Unidos, por favor repórtelo para que podamos agregarlo a nuestra lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "¿Problema con un producto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Producto no encontrado",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SEGURO"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "¡Este producto no proviene de una empresa estadounidense!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Fuente desconocida",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("DESCONOCIDO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "El producto buscado no se ha encontrado en nuestra base de datos.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "¡Este producto proviene de una empresa estadounidense!",
    ),
  };
}
