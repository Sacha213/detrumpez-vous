// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Escaneie o código de barras do seu produto para descobrir se a marca pertence a uma empresa americana.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Escaneie um produto"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marca não encontrada",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Descrição não encontrada",
    ),
    "manualBrandContent": MessageLookupByLibrary.simpleMessage(
      "Por favor, insira a marca do produto",
    ),
    "manualBrandPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Digite a marca",
    ),
    "manualBrandTitle": MessageLookupByLibrary.simpleMessage(
      "Marca não encontrada",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Se você identificou um produto proveniente dos Estados Unidos, por favor, nos avise para que possamos adicioná-lo à nossa lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problema com um produto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produto não encontrado",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SAFE"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este produto não vem de uma empresa americana!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Fonte não encontrada",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("DESCONHECIDO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "O produto procurado não foi encontrado em nosso banco de dados.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este produto vem de uma empresa americana!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validar"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bem-vindo(a) a"),
  };
}
