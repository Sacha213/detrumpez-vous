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
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Escanear o código de barras",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marca não encontrada",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Uma marca é considerada americana se pertencer a um grupo americano.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Critérios para empresas americanas",
    ),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s é uma marca americana, mas foi adquirida pela Unilever (multinacional anglo-holandesa) em 2000. Portanto, a marca não é considerada americana.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné é uma marca francesa, mas foi adquirida pelo grupo americano McCormick em 2000. Portanto, a marca é considerada americana.",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca não está presente em nosso banco de dados de marcas americanas.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Digite uma marca alimentar",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Nossa base já conta com mais de 300 marcas, mas algumas ainda precisam ser identificadas. Se você encontrar um produto dos Estados Unidos que não esteja listado, envie-nos um e-mail com o nome da marca para atualizar nossa lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Problema com um produto?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produto não encontrado",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NÃO USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este produto não parece ser de uma empresa americana.",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Certifique-se de inserir uma marca de alimentos corretamente escrita para evitar erros.",
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
      "Este produto provém de uma empresa americana!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validar"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Ver critérios"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bem-vindo(a) a"),
  };
}
