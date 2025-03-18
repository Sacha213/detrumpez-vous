// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Сканируйте штрих-код вашего продукта, чтобы узнать, принадлежит ли бренд американской компании.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Сканировать продукт"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Бренд не найден"),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Описание не найдено",
    ),
    "manualBrandContent": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите бренд продукта",
    ),
    "manualBrandPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Введите бренд",
    ),
    "manualBrandTitle": MessageLookupByLibrary.simpleMessage("Бренд не найден"),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Если вы нашли продукт из США, пожалуйста, сообщите нам, чтобы мы могли добавить его в наш список.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Проблемы с продуктом?",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Продукт не найден",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("SAFE"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Этот продукт не принадлежит американской компании!",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Источник не найден",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("НЕИЗВЕСТНО"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Продукт, который вы ищете, не найден в нашей базе данных.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Этот продукт принадлежит американской компании!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "welcome": MessageLookupByLibrary.simpleMessage("Добро пожаловать в"),
  };
}
