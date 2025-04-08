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
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Una marca se considera estadounidense si pertenece a un grupo americano.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Criterios para empresas estadounidenses",
    ),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s es una marca estadounidense, pero fue adquirida por Unilever (una multinacional anglo-holandesa) en 2000. Por ello, la marca no se considera estadounidense.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné es una marca francesa, pero fue adquirida por el grupo estadounidense McCormick en 2000. Por ello, la marca se considera estadounidense.",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca no se encuentra en nuestra base de datos de marcas estadounidenses.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ingrese una marca alimentaria",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Nuestra base de datos ya cuenta con más de 300 marcas, pero aún hay algunas por identificar. Si encuentras un producto estadounidense que no esté listado, envíanos un correo electrónico con el nombre de la marca para actualizar nuestra lista.",
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
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Asegúrese de ingresar una marca de alimentos correctamente escrita para evitar errores.",
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
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Ver criterios"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bienvenido a"),
  };
}
