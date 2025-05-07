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

  static String m0(barcode) => "バーコードの不足している詳細を提供してください：${barcode}";

  static String m1(statusCode) =>
      "テキスト情報の送信に失敗しました（ステータス ${statusCode}）。HTML応答についてはログを確認してください。";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "ここをクリックして情報を完成させてください",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("情報を追加"),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage("成分の写真を追加"),
    "addPhoto": MessageLookupByLibrary.simpleMessage("写真を追加"),
    "addProductButton": MessageLookupByLibrary.simpleMessage("製品を追加"),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "データベースに製品を追加してご協力ください",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage("情報を追加"),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "情報の送信中にエラーが発生しました。もう一度お試しください。",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "製品情報を完成させる",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "ありがとうございます！製品情報が追加されました。",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage("情報を追加"),
    "addProductTitle": MessageLookupByLibrary.simpleMessage("製品を追加"),
    "alimentation": MessageLookupByLibrary.simpleMessage("食品"),
    "alimentationAnimaux": MessageLookupByLibrary.simpleMessage("ペットフード"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "製品のバーコードをスキャンして、そのブランドがアメリカ企業によって所有されているかどうかを確認します。",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("バーコードをスキャン"),
    "autre": MessageLookupByLibrary.simpleMessage("その他"),
    "barcode": MessageLookupByLibrary.simpleMessage("バーコード"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("バーコード："),
    "brandHint": MessageLookupByLibrary.simpleMessage("主なブランド名"),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("ブランド *"),
    "brandName": MessageLookupByLibrary.simpleMessage("ブランド名"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage("例：L\'Oréal"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("ブランドが見つかりません"),
    "camera": MessageLookupByLibrary.simpleMessage("カメラ"),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "category": MessageLookupByLibrary.simpleMessage("カテゴリ"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "ここをクリックして基準を確認してください",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "企業はどのように分類されますか？",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "ブランドがアメリカのグループに属している場合、そのブランドはアメリカのものと見なされます。",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage("アメリカ企業の基準"),
    "companyLabel": MessageLookupByLibrary.simpleMessage("会社"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'sはアメリカのブランドですが、2000年にユニリーバ（英蘭の多国籍企業）に買収されました。したがって、このブランドはアメリカのものとは見なされません。",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahinéはフランスのブランドですが、2000年にアメリカのマコーミックグループに買収されました。したがって、このブランドはアメリカのものと見なされます。",
    ),
    "cosmetique": MessageLookupByLibrary.simpleMessage("化粧品"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage("簡単な製品説明"),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage("説明 *"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "このブランドはデータベースに存在しません。",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage("製品の追加中にエラーが発生しました。"),
    "errorTitle": MessageLookupByLibrary.simpleMessage("エラー"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage("このフィールドは必須です。"),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "すべてのフィールドに入力してください。",
    ),
    "gallery": MessageLookupByLibrary.simpleMessage("ギャラリー"),
    "imagePickError": MessageLookupByLibrary.simpleMessage("画像の選択中にエラーが発生しました"),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage("ソースを選択してください"),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("画像ソース"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "画像のアップロード中にエラーが発生しました。",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage("原材料の産地"),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "食品ブランドを入力してください",
    ),
    "originLabel": MessageLookupByLibrary.simpleMessage("原産国"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage("所有会社の名前"),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage("親会社"),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "親会社（オプション）",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "例：フランス、アメリカ、中国...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "親会社の原産国（任意）",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("写真"),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "間違いを犯す可能性があります。間違いを見つけた場合は、リストを更新できるようにブランド名をメールでお知らせください。",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage("製品に問題がありますか？"),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "製品と画像が正常に追加されました！",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("製品名"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "製品名を入力してください",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage("製品が見つかりません"),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "ここをクリックして問題を報告してください",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage("問題を報告"),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "あなたのコメント",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "製品またはアプリケーションで発生した問題を説明してください。",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "フォローアップをご希望の場合はメールアドレスを入力してください",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "有効なメールアドレスを入力してください。",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "メールアドレス (任意)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "レポートの送信中にエラーが発生しました。もう一度お試しください。",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "アプリケーションの改善にご協力ください",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "問題またはエラーを説明してください...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage("レポートを送信"),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "ありがとうございます！レポートが送信されました。",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage("問題を報告"),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "問題を説明してください。",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "詳細を提供してください（最低10文字）。",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("非米国"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "この製品はアメリカ企業のものではないようです。",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage("バーコードをスキャン"),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ エラーを避けるために、正しく綴られた食品ブランドを入力してください。",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage("カテゴリを選択してください"),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "カテゴリを選択してください。",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage("写真を選択してください。"),
    "sendingImage": MessageLookupByLibrary.simpleMessage("画像を送信中..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage("情報を送信中..."),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("ソースが見つかりません"),
    "submissionError": MessageLookupByLibrary.simpleMessage("送信中にエラーが発生しました。"),
    "successMessage": MessageLookupByLibrary.simpleMessage("製品が正常に追加されました！"),
    "successTitle": MessageLookupByLibrary.simpleMessage("成功"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "テキスト情報は送信されましたが、画像のアップロードに失敗しました。",
    ),
    "textSubmissionFailed": m1,
    "unknown": MessageLookupByLibrary.simpleMessage("不明"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "検索した製品はデータベースに見つかりませんでした。",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("米国"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "この製品はアメリカ企業のものです！",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("検証"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("基準を表示"),
    "welcome": MessageLookupByLibrary.simpleMessage("ようこそ"),
  };
}
