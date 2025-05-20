// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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
  String get localeName => 'zh_CN';

  static String m0(barcode) => "提供条形码缺失的详细信息：${barcode}";

  static String m1(error) => "发送出错：${error}";

  static String m2(statusCode) => "发送文本信息失败（状态 ${statusCode}）。检查日志以获取 HTML 响应。";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage("点击此处完成信息"),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("添加信息"),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage("添加配料照片"),
    "addPhoto": MessageLookupByLibrary.simpleMessage("添加照片"),
    "addProductButton": MessageLookupByLibrary.simpleMessage("添加产品"),
    "addProductHelp": MessageLookupByLibrary.simpleMessage("通过向数据库添加产品来帮助我们"),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage("添加信息"),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage("发送信息时出错。请重试。"),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage("完善产品信息"),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "谢谢！产品信息已添加。",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage("添加信息"),
    "addProductTitle": MessageLookupByLibrary.simpleMessage("添加产品"),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "您的替代方案已提交审核",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("替代方案"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "扫描您产品的条形码，了解该品牌是否属于美国公司。",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("扫描条形码"),
    "barcode": MessageLookupByLibrary.simpleMessage("条形码"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("条形码："),
    "beauty": MessageLookupByLibrary.simpleMessage("美容"),
    "brandHint": MessageLookupByLibrary.simpleMessage("主要品牌名称"),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("品牌 *"),
    "brandName": MessageLookupByLibrary.simpleMessage("品牌名称"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage("例如：L\'Oréal"),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("未找到品牌"),
    "camera": MessageLookupByLibrary.simpleMessage("相机"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "category": MessageLookupByLibrary.simpleMessage("类别"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "点击此处了解我们的标准",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage("公司如何分类？"),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "如果一个品牌属于美国集团，则该品牌被视为美国品牌。",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage("美国公司标准"),
    "companyLabel": MessageLookupByLibrary.simpleMessage("公司"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s 是一个美国品牌，但在 2000 年被联合利华（一家英荷跨国公司）收购。因此，该品牌不被视为美国品牌。",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné 是一个法国品牌，但在 2000 年被美国 McCormick 集团收购。因此，该品牌被视为美国品牌。",
    ),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "您可以在 Open Secret 网站上找到 2024 年美国大选的贡献金额。",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage("保存贡献时出错。"),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "谢谢！您的贡献已提交审核，将在48小时内处理。",
    ),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "金额（民主党）",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage("民主党贡献"),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("民主党人"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage("简短的产品描述"),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage("描述 *"),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "我们的数据库中不存在此品牌。",
    ),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage("编辑"),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "编辑 2024 年美国总统选举的政治捐款",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage("添加产品时出错。"),
    "errorTitle": MessageLookupByLibrary.simpleMessage("错误"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage("此字段是必填字段。"),
    "fillAllFields": MessageLookupByLibrary.simpleMessage("请填写所有字段。"),
    "food": MessageLookupByLibrary.simpleMessage("食品"),
    "gallery": MessageLookupByLibrary.simpleMessage("相册"),
    "imagePickError": MessageLookupByLibrary.simpleMessage("选择图片时出错"),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage("选择一个来源"),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("图片来源"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage("上传图片时出错。"),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage("配料来源"),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage("请输入有效的数字。"),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage("输入品牌"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage("尚无替代方案。"),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "尚无政治捐款。",
    ),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("确定"),
    "originLabel": MessageLookupByLibrary.simpleMessage("原产国"),
    "other": MessageLookupByLibrary.simpleMessage("其他"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage("所有公司的名称"),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage("母公司"),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "母公司（可选）",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage("例如：法国、美国、中国..."),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "母公司原产国（可选）",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("宠物食品"),
    "photo": MessageLookupByLibrary.simpleMessage("照片"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "政治捐款 2024",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "我们可能会犯错。如果您发现错误，请通过电子邮件将品牌名称发送给我们，以便我们更新列表。",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage("产品有问题？"),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "产品和图片添加成功！",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("产品名称"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage("输入产品名称"),
    "productNotFound": MessageLookupByLibrary.simpleMessage("未找到产品"),
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage("提出替代方案"),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "点击此处报告问题",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage("报告问题"),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage("您的评论"),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "描述产品或应用程序遇到的问题。",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "如果您希望收到回复，请输入您的电子邮件",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "请输入有效的电子邮件地址。",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "您的电子邮件 (可选)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "发送报告时出错。请重试。",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage("帮助我们改进应用程序"),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage("描述问题或错误..."),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage("发送报告"),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "谢谢！您的报告已发送。",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage("报告问题"),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "请描述问题。",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "请提供更多详细信息（最少 10 个字符）。",
    ),
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "金额（共和党）",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "共和党贡献",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("共和党人"),
    "safe": MessageLookupByLibrary.simpleMessage("非美国"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage("该产品似乎不属于美国公司。"),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage("保存贡献"),
    "savingContributions": MessageLookupByLibrary.simpleMessage("正在保存贡献..."),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage("扫描条形码"),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ 请确保输入拼写正确的食品品牌，以避免错误。",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage("选择一个类别"),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage("请选择一个类别。"),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage("请选择一张照片。"),
    "sendingImage": MessageLookupByLibrary.simpleMessage("正在发送图片..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage("正在发送信息..."),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("未找到来源"),
    "submissionError": MessageLookupByLibrary.simpleMessage("提交过程中出错。"),
    "successMessage": MessageLookupByLibrary.simpleMessage("产品添加成功！"),
    "successTitle": MessageLookupByLibrary.simpleMessage("成功"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "文本信息已发送，但图片上传失败。",
    ),
    "textSubmissionFailed": m2,
    "unknown": MessageLookupByLibrary.simpleMessage("未知"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "您搜索的产品在我们的数据库中未找到。",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("美国"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage("该产品来自一家美国公司！"),
    "validate": MessageLookupByLibrary.simpleMessage("验证"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("查看标准"),
    "welcome": MessageLookupByLibrary.simpleMessage("欢迎来到"),
  };
}
