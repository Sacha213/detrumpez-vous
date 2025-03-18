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
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Escanea el código de barras de tu producto para descubrir si la marca pertenece a una empresa estadounidense.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Escanea un producto"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marca no encontrada",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca no está representada en nuestra base de datos de marcas estadounidenses.",
    ),
    "manualBrandContent": MessageLookupByLibrary.simpleMessage(
      "Por favor, ingresa la marca del producto",
    ),
    "manualBrandPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ingresa la marca",
    ),
    "manualBrandTitle": MessageLookupByLibrary.simpleMessage(
      "Marca no encontrada",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ingresa la marca y busca",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Si has identificado un producto proveniente de Estados Unidos, por favor repórtalo para que podamos agregarlo a nuestra lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "¿Problema con un producto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Producto no encontrado",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SAFE"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "¡Este producto no proviene de una empresa estadounidense!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Fuente no encontrada",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("DESCONOCIDO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "El producto que buscaste no se encuentra en nuestra base de datos.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "¡Este producto proviene de una empresa estadounidense!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validar"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bienvenido a"),
  };
}
