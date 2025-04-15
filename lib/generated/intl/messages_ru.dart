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

  static String m1(statusCode) =>
      "Не удалось отправить текстовую информацию (статус ${statusCode}). Проверьте логи для ответа HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Нажмите здесь, чтобы дополнить информацию",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("Добавить информацию"),
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
    "alimentation": MessageLookupByLibrary.simpleMessage("Продукты питания"),
    "alimentationAnimaux": MessageLookupByLibrary.simpleMessage(
      "Корм для животных",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Отсканируйте штрих-код вашего продукта, чтобы узнать, принадлежит ли бренд американской компании.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Сканировать штрих-код"),
    "autre": MessageLookupByLibrary.simpleMessage("Другое"),
    "barcode": MessageLookupByLibrary.simpleMessage("Штрих-код"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Штрих-код: "),
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
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s — американский бренд, но в 2000 году он был приобретен Unilever (англо-голландской транснациональной корпорацией). Таким образом, бренд не считается американским.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné — французский бренд, но в 2000 году он был приобретен американской группой McCormick. Таким образом, бренд считается американским.",
    ),
    "cosmetique": MessageLookupByLibrary.simpleMessage("Косметика"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Краткое описание продукта",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Описание *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Этого бренда нет в нашей базе данных.",
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
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Введите бренд продуктов питания",
    ),
    "originCountryHint": MessageLookupByLibrary.simpleMessage(
      "Пример: Франция, США, Китай...",
    ),
    "originCountryLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Страна происхождения (Необязательно)",
    ),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Название компании-владельца",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage(
      "Материнская компания",
    ),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Материнская компания (Необязательно)",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Фото"),
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
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Нажмите здесь, чтобы сообщить о проблеме",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Сообщить о проблеме",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Опишите проблему, возникшую с продуктом или приложением.",
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
    "safe": MessageLookupByLibrary.simpleMessage("НЕ США"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Этот продукт, похоже, не от американской компании.",
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
    "textSubmissionFailed": m1,
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
