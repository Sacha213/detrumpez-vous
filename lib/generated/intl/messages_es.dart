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
      "Escanee el código de barras de su producto para descubrir si la marca pertenece a una empresa estadounidense.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Escanee el código de barras",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marca no encontrada",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca no se encuentra en nuestra base de datos de marcas estadounidenses.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ingrese una marca alimentaria",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "No somos perfectos y es posible que aún no hayamos identificado todas las marcas. Sin embargo, nuestra base de datos ya incluye más de 400 marcas de alimentos. Si encuentras un producto de los Estados Unidos que no esté listado, por favor envíanos un correo electrónico con el nombre de la marca para que podamos actualizar nuestra lista. Solos avanzamos rápido, pero juntos podemos llegar más lejos.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "¿Problema con un producto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Producto no encontrado",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NO USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este producto no parece provenir de una empresa estadounidense.",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Fuente no encontrada",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("DESCONOCIDO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "El producto que buscó no se encuentra en nuestra base de datos.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "¡Este producto proviene de una empresa estadounidense!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validar"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bienvenido a"),
  };
}
