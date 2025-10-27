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

  static String m1(error) => "送信エラー：${error}";

  static String m2(value) => "${value} g";

  static String m3(details) => "原材料写真のアップロードに失敗しました：${details}";

  static String m4(value) => "${value} kcal";

  static String m5(group) => "グループ ${group}";

  static String m6(details) => "栄養表写真のアップロードに失敗しました：${details}";

  static String m7(statusCode) =>
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
    "additivesTitle": MessageLookupByLibrary.simpleMessage("添加物"),
    "allergensTitle": MessageLookupByLibrary.simpleMessage("アレルゲン"),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "代替案が確認のため送信されました",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("代替案"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "製品のバーコードをスキャンして、そのブランドがアメリカ企業によって所有されているかどうかを確認します。",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("バーコードをスキャン"),
    "barcode": MessageLookupByLibrary.simpleMessage("バーコード"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("バーコード："),
    "beauty": MessageLookupByLibrary.simpleMessage("美容"),
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
    "close": MessageLookupByLibrary.simpleMessage("閉じる"),
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
    "considerAsAmericanIfLinkedToUSA": MessageLookupByLibrary.simpleMessage(
      "米国と関連している場合はアメリカ人とみなす",
    ),
    "contribution": MessageLookupByLibrary.simpleMessage("貢献"),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "2024年の米国選挙の寄付額は、Open Secretのウェブサイトで確認できます。",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "寄付の保存中にエラーが発生しました。",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "ありがとうございます！あなたの寄付は審査のために送信され、48時間以内に処理されます。",
    ),
    "contributorModeInfo": MessageLookupByLibrary.simpleMessage("貢献者モードの詳細情報"),
    "counter": MessageLookupByLibrary.simpleMessage("カウンター"),
    "counterResetSuccess": MessageLookupByLibrary.simpleMessage(
      "カウンターがリセットされました",
    ),
    "counterTitle": MessageLookupByLibrary.simpleMessage("米国カウンター"),
    "countrySelectionScreenTitle": MessageLookupByLibrary.simpleMessage("原産国"),
    "defectsTitle": MessageLookupByLibrary.simpleMessage("欠点"),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "金額（民主党）",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "民主党の寄付",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("民主党"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage("簡単な製品説明"),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage("説明 *"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "このブランドはデータベースに存在しません。",
    ),
    "display": MessageLookupByLibrary.simpleMessage("表示"),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage("編集"),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "2024年アメリカ大統領選挙の政治献金を編集",
    ),
    "enableBoycottMode": MessageLookupByLibrary.simpleMessage("ボイコットモードを有効にする"),
    "enableContributorMode": MessageLookupByLibrary.simpleMessage(
      "貢献者モードを有効にする",
    ),
    "energyHigh": MessageLookupByLibrary.simpleMessage("高カロリー"),
    "energyLow": MessageLookupByLibrary.simpleMessage("低カロリー"),
    "energyMedium": MessageLookupByLibrary.simpleMessage("中程度のカロリー"),
    "energyTitle": MessageLookupByLibrary.simpleMessage("カロリー"),
    "errorMessage": MessageLookupByLibrary.simpleMessage("製品の追加中にエラーが発生しました。"),
    "errorTitle": MessageLookupByLibrary.simpleMessage("エラー"),
    "fallbackProduct": MessageLookupByLibrary.simpleMessage("商品"),
    "fatHigh": MessageLookupByLibrary.simpleMessage("高脂肪"),
    "fatLow": MessageLookupByLibrary.simpleMessage("低脂肪"),
    "fatMedium": MessageLookupByLibrary.simpleMessage("適度な脂肪"),
    "fatTitle": MessageLookupByLibrary.simpleMessage("脂肪"),
    "fiberHigh": MessageLookupByLibrary.simpleMessage("食物繊維が多い"),
    "fiberLow": MessageLookupByLibrary.simpleMessage("食物繊維が少ない"),
    "fiberMedium": MessageLookupByLibrary.simpleMessage("食物繊維がいくつか"),
    "fiberTitle": MessageLookupByLibrary.simpleMessage("食物繊維"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage("このフィールドは必須です。"),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "すべてのフィールドに入力してください。",
    ),
    "followUsOnInstagram": MessageLookupByLibrary.simpleMessage(
      "Instagramでフォロー",
    ),
    "food": MessageLookupByLibrary.simpleMessage("食品"),
    "gallery": MessageLookupByLibrary.simpleMessage("ギャラリー"),
    "general": MessageLookupByLibrary.simpleMessage("一般"),
    "gramsValue": m2,
    "healthLabel": MessageLookupByLibrary.simpleMessage("健康"),
    "however": MessageLookupByLibrary.simpleMessage("しかし"),
    "imagePickError": MessageLookupByLibrary.simpleMessage("画像の選択中にエラーが発生しました"),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage("ソースを選択してください"),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("画像ソース"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "画像のアップロード中にエラーが発生しました。",
    ),
    "informationTitle": MessageLookupByLibrary.simpleMessage("情報"),
    "ingredientPhotoUploadFailed": m3,
    "ingredientsOptional": MessageLookupByLibrary.simpleMessage("材料（オプション）"),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage("原材料の産地"),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "有効な数字を入力してください。",
    ),
    "kcalValue": m4,
    "languageSelection": MessageLookupByLibrary.simpleMessage("言語の選択"),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "ブランドを入力してください",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("モード"),
    "naLabel": MessageLookupByLibrary.simpleMessage("N/A"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage("まだ代替案はありません。"),
    "noHealthInfo": MessageLookupByLibrary.simpleMessage("健康に関する情報はありません"),
    "noInfo": MessageLookupByLibrary.simpleMessage("情報なし"),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "まだ政治献金はありません。",
    ),
    "novaGroup1Desc": MessageLookupByLibrary.simpleMessage("未加工または最小限の加工食品"),
    "novaGroup2Desc": MessageLookupByLibrary.simpleMessage("加工された料理の材料"),
    "novaGroup3Desc": MessageLookupByLibrary.simpleMessage("加工食品"),
    "novaGroup4Desc": MessageLookupByLibrary.simpleMessage("超加工食品"),
    "novaGroupAdditional": m5,
    "novaGroupTitle": MessageLookupByLibrary.simpleMessage("NOVAグループ"),
    "novaGroupUnknown": MessageLookupByLibrary.simpleMessage("不明なグループ"),
    "nutritionPhotoUploadFailed": m6,
    "nutritionTablePhoto": MessageLookupByLibrary.simpleMessage("栄養表"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "optionsTitle": MessageLookupByLibrary.simpleMessage("オプション"),
    "organicNo": MessageLookupByLibrary.simpleMessage("非オーガニック"),
    "organicTitle": MessageLookupByLibrary.simpleMessage("オーガニック"),
    "organicYes": MessageLookupByLibrary.simpleMessage("オーガニック製品"),
    "originLabel": MessageLookupByLibrary.simpleMessage("原産国"),
    "originOfIngredients": MessageLookupByLibrary.simpleMessage("原材料の原産地"),
    "other": MessageLookupByLibrary.simpleMessage("その他"),
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
    "petFood": MessageLookupByLibrary.simpleMessage("ペットフード"),
    "photo": MessageLookupByLibrary.simpleMessage("写真"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "政治献金 2024",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("環境設定"),
    "preferencesScreenTitle": MessageLookupByLibrary.simpleMessage("環境設定"),
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
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage("代替案を提案"),
    "proteinsHigh": MessageLookupByLibrary.simpleMessage("たんぱく質が多い"),
    "proteinsLow": MessageLookupByLibrary.simpleMessage("たんぱく質が少ない"),
    "proteinsMedium": MessageLookupByLibrary.simpleMessage("たんぱく質がいくつか"),
    "proteinsTitle": MessageLookupByLibrary.simpleMessage("たんぱく質"),
    "qualitiesTitle": MessageLookupByLibrary.simpleMessage("品質"),
    "reportProblem": MessageLookupByLibrary.simpleMessage("問題を報告"),
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
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "金額（共和党）",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "共和党の寄付",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("共和党"),
    "reset": MessageLookupByLibrary.simpleMessage("リセット"),
    "resetButton": MessageLookupByLibrary.simpleMessage("リセット"),
    "resetCounter": MessageLookupByLibrary.simpleMessage("カウンターをリセット"),
    "resetSuccessSnack": MessageLookupByLibrary.simpleMessage("スコアをリセットしました"),
    "safe": MessageLookupByLibrary.simpleMessage("非米国"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "この製品はアメリカ企業のものではないようです。",
    ),
    "saltHigh": MessageLookupByLibrary.simpleMessage("塩分が多い"),
    "saltLow": MessageLookupByLibrary.simpleMessage("低塩"),
    "saltMedium": MessageLookupByLibrary.simpleMessage("適度な塩分"),
    "saltTitle": MessageLookupByLibrary.simpleMessage("塩分"),
    "saturatedFatHigh": MessageLookupByLibrary.simpleMessage("飽和脂肪が多い"),
    "saturatedFatLow": MessageLookupByLibrary.simpleMessage("低飽和脂肪"),
    "saturatedFatMedium": MessageLookupByLibrary.simpleMessage("適度な飽和脂肪"),
    "saturatedFatTitle": MessageLookupByLibrary.simpleMessage("飽和脂肪"),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage("寄付を保存"),
    "savingContributions": MessageLookupByLibrary.simpleMessage("寄付を保存中..."),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage("バーコードをスキャン"),
    "scoresResetSuccess": MessageLookupByLibrary.simpleMessage("スコアがリセットされました"),
    "searchCountryPlaceholder": MessageLookupByLibrary.simpleMessage("国を検索"),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ エラーを避けるために、正しく綴られた食品ブランドを入力してください。",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage("カテゴリを選択してください"),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "カテゴリを選択してください。",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage("国を選択…"),
    "selectIngredientPhotoError": MessageLookupByLibrary.simpleMessage(
      "原材料の写真を選択してください。",
    ),
    "selectNutritionPhotoError": MessageLookupByLibrary.simpleMessage(
      "栄養表の写真を選択してください。",
    ),
    "selectOriginCountries": MessageLookupByLibrary.simpleMessage("原産国を選択"),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage("写真を選択してください。"),
    "sendingImage": MessageLookupByLibrary.simpleMessage("画像を送信中..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage("情報を送信中..."),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("設定"),
    "showTrumpHead": MessageLookupByLibrary.simpleMessage("トランプの顔を表示"),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("ソースが見つかりません"),
    "submissionError": MessageLookupByLibrary.simpleMessage("送信中にエラーが発生しました。"),
    "successMessage": MessageLookupByLibrary.simpleMessage("製品が正常に追加されました！"),
    "successTitle": MessageLookupByLibrary.simpleMessage("成功"),
    "sugarsHigh": MessageLookupByLibrary.simpleMessage("糖分が多い"),
    "sugarsLow": MessageLookupByLibrary.simpleMessage("低糖"),
    "sugarsMedium": MessageLookupByLibrary.simpleMessage("適度な糖"),
    "sugarsTitle": MessageLookupByLibrary.simpleMessage("糖"),
    "supportCommunity": MessageLookupByLibrary.simpleMessage("サポートとコミュニティ"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "テキスト情報は送信されましたが、画像のアップロードに失敗しました。",
    ),
    "textSubmissionFailed": m7,
    "unableToOpenInstagram": MessageLookupByLibrary.simpleMessage(
      "Instagramを開けません",
    ),
    "unableToOpenLink": MessageLookupByLibrary.simpleMessage("リンクを開けません"),
    "unknown": MessageLookupByLibrary.simpleMessage("不明"),
    "unknownData": MessageLookupByLibrary.simpleMessage("データなし"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "検索した製品はデータベースに見つかりませんでした。",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("米国"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "この製品はアメリカ企業のものです！",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("検証"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("基準を表示"),
    "visitWebsite": MessageLookupByLibrary.simpleMessage("ウェブサイトを訪問"),
    "welcome": MessageLookupByLibrary.simpleMessage("ようこそ"),
    "xPrefix": MessageLookupByLibrary.simpleMessage("x"),
  };
}
