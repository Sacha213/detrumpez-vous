// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(barcode) =>
      "Proporcione los detalles faltantes para el código de barras: ${barcode}";

  static String m1(error) => "Error al enviar: ${error}";

  static String m2(details) =>
      "Error al subir la foto de ingredientes: ${details}";

  static String m3(details) => "Error al subir la foto nutricional: ${details}";

  static String m4(statusCode) =>
      "Error al enviar la información de texto (estado ${statusCode}). Revise los logs para la respuesta HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Haga clic aquí para completar la información",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("Añadir información"),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Agregar foto de ingredientes",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Añadir una foto"),
    "addProductButton": MessageLookupByLibrary.simpleMessage("Añadir producto"),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Ayúdanos añadiendo un producto a la base de datos",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Añadir información",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Error al enviar la información. Por favor, inténtelo de nuevo.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Completar información del producto",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "¡Gracias! La información de su producto ha sido enviada para revisión y se añadirá en un plazo de 48 horas.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Añadir información",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Añadir un producto",
    ),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "¡Gracias! Su alternativa ha sido enviada para revisión y será procesada en un plazo de 48 horas.",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Alternativas"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Escanee el código de barras de su producto para saber si la marca pertenece a una empresa estadounidense.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Escanear código de barras",
    ),
    "barcode": MessageLookupByLibrary.simpleMessage("Código de barras"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Código de barras: "),
    "beauty": MessageLookupByLibrary.simpleMessage("Belleza"),
    "brandHint": MessageLookupByLibrary.simpleMessage(
      "Nombre de la marca principal",
    ),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Marca *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Nombre de la marca"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ej: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marca no encontrada",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Cámara"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "category": MessageLookupByLibrary.simpleMessage("Categoría"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Haga clic aquí para descubrir nuestros criterios",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "¿Cómo se clasifican las empresas?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Una marca se considera estadounidense si pertenece a un grupo estadounidense.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Criterios de empresa estadounidense",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Empresa"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s es una marca estadounidense pero fue adquirida por Unilever (multinacional anglo-holandesa) en 2000. Por lo tanto, la marca no se considera estadounidense.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné es una marca francesa pero fue adquirida por el grupo estadounidense McCormick en 2000. Por lo tanto, la marca se considera estadounidense.",
    ),
    "considerAsAmericanIfLinkedToUSA": MessageLookupByLibrary.simpleMessage(
      "Considerar como estadounidense si está vinculado a EE. UU.",
    ),
    "contribution": MessageLookupByLibrary.simpleMessage("Contribución"),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "Puedes encontrar los montos de las contribuciones para las elecciones de EE. UU. 2024 en el sitio web Open Secret.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Error al guardar las contribuciones.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "¡Gracias! Sus contribuciones han sido enviadas para revisión y serán procesadas dentro de 48 horas.",
    ),
    "contributorModeInfo": MessageLookupByLibrary.simpleMessage(
      "Más info sobre el modo colaborador",
    ),
    "counter": MessageLookupByLibrary.simpleMessage("Contador"),
    "counterResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Contador restablecido correctamente",
    ),
    "countrySelectionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Países de origen",
    ),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Monto (Demócratas)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Contribuciones Demócratas",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Demócratas"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Descripción corta del producto",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Descripción *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca no está presente en nuestra base de datos.",
    ),
    "display": MessageLookupByLibrary.simpleMessage("Pantalla"),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Editar",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Editar las contribuciones políticas para la elección presidencial estadounidense de 2024",
    ),
    "enableBoycottMode": MessageLookupByLibrary.simpleMessage(
      "Activar modo boicot",
    ),
    "enableContributorMode": MessageLookupByLibrary.simpleMessage(
      "Activar modo colaborador",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Se produjo un error al añadir el producto.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Error"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Este campo es obligatorio.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Por favor, rellene todos los campos.",
    ),
    "followUsOnInstagram": MessageLookupByLibrary.simpleMessage(
      "Síguenos en Instagram",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Alimentos"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galería"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "however": MessageLookupByLibrary.simpleMessage("Sin embargo"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Error al seleccionar la imagen",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage(
      "Elija una fuente",
    ),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage(
      "Fuente de la imagen",
    ),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Error al subir la imagen.",
    ),
    "ingredientPhotoUploadFailed": m2,
    "ingredientsOptional": MessageLookupByLibrary.simpleMessage(
      "Ingredientes (opcional)",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Origen de los ingredientes",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Por favor, introduce un número válido.",
    ),
    "languageSelection": MessageLookupByLibrary.simpleMessage(
      "Selección de idioma",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ingrese una marca",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Modo"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "Aún no hay alternativas.",
    ),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "Todavía no hay contribuciones políticas.",
    ),
    "nutritionPhotoUploadFailed": m3,
    "nutritionTablePhoto": MessageLookupByLibrary.simpleMessage(
      "Tabla nutricional",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "originLabel": MessageLookupByLibrary.simpleMessage("País de origen"),
    "originOfIngredients": MessageLookupByLibrary.simpleMessage(
      "Origen de los ingredientes",
    ),
    "other": MessageLookupByLibrary.simpleMessage("Otro"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Nombre de la empresa propietaria",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage(
      "Empresa matriz",
    ),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Empresa matriz (Opcional)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Ej: Francia, USA, China...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "País de origen de la empresa matriz (Opcional)",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("Comida para mascotas"),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Contribuciones políticas 2024",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferencias"),
    "preferencesScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Preferencias",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Podemos cometer errores. Si detecta uno, envíenos un correo electrónico con el nombre de la marca para que podamos actualizar nuestra lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "¿Un problema con un producto?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "¡Producto e imagen añadidos con éxito!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Nombre del producto"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ingrese el nombre del producto",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Producto no encontrado",
    ),
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Proponer una alternativa",
    ),
    "reportProblem": MessageLookupByLibrary.simpleMessage(
      "Reportar un problema",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Haga clic aquí para reportar un problema",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Reportar un problema",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Tus comentarios",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Describa el problema encontrado con el producto o la aplicación.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Ingresa tu correo electrónico si deseas un seguimiento",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Por favor, ingresa una dirección de correo electrónico válida.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Tu correo electrónico (Opcional)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Error al enviar el reporte. Por favor, inténtelo de nuevo.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Ayúdanos a mejorar la aplicación",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Describa el problema o error...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Enviar reporte",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "¡Gracias! Su informe ha sido enviado para revisión y será procesado en un plazo de 48 horas.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Reportar un problema",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Por favor, describa el problema.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Por favor, proporcione más detalles (mínimo 10 caracteres).",
    ),
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Monto (Republicanos)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Contribuciones Republicanas",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Republicanos"),
    "reset": MessageLookupByLibrary.simpleMessage("Restablecer"),
    "resetCounter": MessageLookupByLibrary.simpleMessage(
      "Restablecer contador",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NO USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este producto no parece provenir de una empresa estadounidense.",
    ),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Guardar Contribuciones",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Guardando contribuciones...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Scannez un code‑barres",
    ),
    "scoresResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Puntuaciones restablecidas correctamente",
    ),
    "searchCountryPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Buscar país",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Asegúrese de ingresar una marca de alimentos correctamente escrita para evitar errores.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Seleccione una categoría",
    ),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Por favor, seleccione una categoría.",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "Seleccione país(es)…",
    ),
    "selectIngredientPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor seleccione una foto de los ingredientes.",
    ),
    "selectNutritionPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor seleccione una foto de la tabla nutricional.",
    ),
    "selectOriginCountries": MessageLookupByLibrary.simpleMessage(
      "Seleccione países de origen",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor, seleccione una foto.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Enviando imagen..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Enviando información...",
    ),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Ajustes"),
    "showTrumpHead": MessageLookupByLibrary.simpleMessage(
      "Mostrar la cabeza de Trump",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Fuente no encontrada",
    ),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Error durante el envío.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "¡Producto añadido con éxito!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Éxito"),
    "supportCommunity": MessageLookupByLibrary.simpleMessage(
      "Soporte y comunidad",
    ),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "La información de texto se envió, pero falló la subida de la imagen.",
    ),
    "textSubmissionFailed": m4,
    "unableToOpenInstagram": MessageLookupByLibrary.simpleMessage(
      "No se puede abrir Instagram",
    ),
    "unableToOpenLink": MessageLookupByLibrary.simpleMessage(
      "No se puede abrir el enlace",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("DESCONOCIDO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "El producto que buscó no se encontró en nuestra base de datos.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "¡Este producto proviene de una empresa estadounidense!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validar"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Ver criterios"),
    "visitWebsite": MessageLookupByLibrary.simpleMessage(
      "Visitar nuestro sitio",
    ),
    "welcome": MessageLookupByLibrary.simpleMessage("Bienvenido a"),
  };
}
