// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "扫描您产品的条形码，了解该品牌是否属于美国公司。",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("扫描条形码"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("未找到品牌"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "此品牌不在我们的美国品牌数据库中。",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage("输入食品品牌"),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "如果您发现来自美国的产品，请报告，以便我们将其添加到列表中。",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage("产品存在问题？"),
    "productNotFound": MessageLookupByLibrary.simpleMessage("未找到产品"),
    "safe": MessageLookupByLibrary.simpleMessage("非美国"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage("该产品不属于美国公司！"),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("未找到来源"),
    "unknown": MessageLookupByLibrary.simpleMessage("未知"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "未在我们的数据库中找到您搜索的产品。",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("美国"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage("该产品属于美国公司！"),
    "validate": MessageLookupByLibrary.simpleMessage("确认"),
    "welcome": MessageLookupByLibrary.simpleMessage("欢迎进入"),
  };
}
