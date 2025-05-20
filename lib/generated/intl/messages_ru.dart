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

  static String m0(barcode) =>
      "Предоставьте недостающие данные для штрих-кода: ${barcode}";

  static String m1(error) => "Ошибка при отправке: ${error}";

  static String m2(statusCode) =>
      "Не удалось отправить текстовую информацию (статус ${statusCode}). Проверьте логи для ответа HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Нажмите здесь, чтобы дополнить информацию",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("Добавить информацию"),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Добавить фото ингредиентов",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Добавить фото"),
    "addProductButton": MessageLookupByLibrary.simpleMessage(
      "Добавить продукт",
    ),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Помогите нам, добавив продукт в базу данных",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Добавить информацию",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Ошибка при отправке информации. Пожалуйста, попробуйте еще раз.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Заполнить информацию о продукте",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Спасибо! Информация о продукте добавлена.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Добавить информацию",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage("Добавить продукт"),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "Ваша альтернатива отправлена на проверку",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Альтернативы"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Отсканируйте штрих-код вашего продукта, чтобы узнать, принадлежит ли бренд американской компании.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Сканировать штрих-код"),
    "barcode": MessageLookupByLibrary.simpleMessage("Штрих-код"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Штрих-код: "),
    "beauty": MessageLookupByLibrary.simpleMessage("Красота"),
    "brandHint": MessageLookupByLibrary.simpleMessage(
      "Основное название бренда",
    ),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Бренд *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Название бренда"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Пример: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Бренд не найден"),
    "camera": MessageLookupByLibrary.simpleMessage("Камера"),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "category": MessageLookupByLibrary.simpleMessage("Категория"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Нажмите здесь, чтобы ознакомиться с нашими критериями",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Как классифицируются компании?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Бренд считается американским, если он принадлежит американской группе.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Критерии американской компании",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Компания"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s — американский бренд, но в 2000 году он был приобретен Unilever (англо-голландской транснациональной корпорацией). Таким образом, бренд не считается американским.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné — французский бренд, но в 2000 году он был приобретен американской группой McCormick. Таким образом, бренд считается американским.",
    ),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "Вы можете найти суммы взносов для выборов в США 2024 года на сайте Open Secret.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Ошибка при сохранении взносов.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Спасибо! Ваши взносы были отправлены на проверку и будут обработаны в течение 48 часов.",
    ),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Сумма (демократы)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Взносы демократов",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Демократы"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Краткое описание продукта",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Описание *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Этого бренда нет в нашей базе данных.",
    ),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Изменить",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Редактировать политические взносы для президентских выборов в США 2024 года",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Произошла ошибка при добавлении продукта.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Ошибка"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Это поле обязательно для заполнения.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, заполните все поля.",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Еда"),
    "gallery": MessageLookupByLibrary.simpleMessage("Галерея"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Ошибка при выборе изображения",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage(
      "Выберите источник",
    ),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage(
      "Источник изображения",
    ),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Ошибка при загрузке изображения.",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Происхождение ингредиентов",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите действительное число.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Введите бренд",
    ),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "Пока нет альтернатив.",
    ),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "Пока нет политических взносов.",
    ),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "originLabel": MessageLookupByLibrary.simpleMessage("Страна происхождения"),
    "other": MessageLookupByLibrary.simpleMessage("Другое"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Название компании-владельца",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage(
      "Материнская компания",
    ),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Материнская компания (Необязательно)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Пример: Франция, США, Китай...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Страна происхождения материнской компании (Необязательно)",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("Корм для животных"),
    "photo": MessageLookupByLibrary.simpleMessage("Фото"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Политические взносы 2024",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Мы можем ошибаться. Если вы заметили ошибку, пожалуйста, напишите нам название бренда по электронной почте, чтобы мы могли обновить наш список.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Проблема с продуктом?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Продукт и изображение успешно добавлены!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Название продукта"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Введите название продукта",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Продукт не найден",
    ),
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Предложить альтернативу",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Нажмите здесь, чтобы сообщить о проблеме",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Сообщить о проблеме",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Ваши комментарии",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Опишите проблему, возникшую с продуктом или приложением.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Введите ваш Email, если хотите получить ответ",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите действительный адрес электронной почты.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Ваш Email (Необязательно)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Ошибка при отправке отчета. Пожалуйста, попробуйте еще раз.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Помогите нам улучшить приложение",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Опишите проблему или ошибку...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Отправить отчет",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Спасибо! Ваш отчет отправлен.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Сообщить о проблеме",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, опишите проблему.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, предоставьте больше деталей (мин. 10 символов).",
    ),
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Сумма (республиканцы)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Взносы республиканцев",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Республиканцы"),
    "safe": MessageLookupByLibrary.simpleMessage("НЕ США"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Этот продукт, похоже, не от американской компании.",
    ),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Сохранить взносы",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Сохранение взносов...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Сканируйте штрих‑код",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Убедитесь, что вы вводите правильно написанный бренд продуктов питания, чтобы избежать ошибок.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Выберите категорию",
    ),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, выберите категорию.",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, выберите фото.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage(
      "Отправка изображения...",
    ),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Отправка информации...",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Источник не найден",
    ),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Ошибка при отправке.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Продукт успешно добавлен!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Успех"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Текстовая информация отправлена, но загрузка изображения не удалась.",
    ),
    "textSubmissionFailed": m2,
    "unknown": MessageLookupByLibrary.simpleMessage("НЕИЗВЕСТНО"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Продукт, который вы искали, не найден в нашей базе данных.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("США"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Этот продукт от американской компании!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Подтвердить"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Посмотреть критерии"),
    "welcome": MessageLookupByLibrary.simpleMessage("Добро пожаловать в"),
  };
}
