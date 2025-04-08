// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "製品のバーコードをスキャンして、そのブランドがアメリカの企業によって所有されているかどうかを確認してください。",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("バーコードをスキャンする"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("ブランドが見つかりませんでした"),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "ブランドがアメリカのグループに属していれば、アメリカンブランドと見なされます。",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage("アメリカ企業の基準"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s はアメリカのブランドですが、2000年に Unilever（英蘭系多国籍企業）に買収されました。したがって、このブランドはアメリカと見なされません。",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné はフランスのブランドですが、2000年にアメリカの McCormick グループに買収されました。したがって、このブランドはアメリカと見なされます。",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "このブランドは私たちのアメリカブランドデータベースにありません。",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "食品ブランドを入力してください",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "当社のデータベースには既に300以上のブランドが登録されていますが、まだ識別されていないものもあります。もしリストにないアメリカ製品を見つけた場合は、ブランド名を記載したメールをお送りください。",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage("製品に問題がありますか？"),
    "productNotFound": MessageLookupByLibrary.simpleMessage("製品が見つかりませんでした"),
    "safe": MessageLookupByLibrary.simpleMessage("アメリカ以外"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "この製品は、アメリカの企業のものではないようです。",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ エラーを避けるために、食品ブランドを正しく綴って入力してください。",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("情報源が見つかりません"),
    "unknown": MessageLookupByLibrary.simpleMessage("不明"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "ご指定の商品はデータベースに見つかりませんでした。",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("アメリカ"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "この製品はアメリカの企業に属しています！",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("確認"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("基準を見る"),
    "welcome": MessageLookupByLibrary.simpleMessage("ようこそ"),
  };
}
