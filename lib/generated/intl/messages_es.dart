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

  static String m1(statusCode) =>
      "Error al enviar la información de texto (estado ${statusCode}). Revise los logs para la respuesta HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Haga clic aquí para completar la información",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("Añadir información"),
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
      "¡Gracias! Información del producto añadida.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Añadir información",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Añadir un producto",
    ),
    "alimentation": MessageLookupByLibrary.simpleMessage("Alimentación"),
    "alimentationAnimaux": MessageLookupByLibrary.simpleMessage(
      "Alimentos para mascotas",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Escanee el código de barras de su producto para saber si la marca pertenece a una empresa estadounidense.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Escanear código de barras",
    ),
    "autre": MessageLookupByLibrary.simpleMessage("Otro"),
    "barcode": MessageLookupByLibrary.simpleMessage("Código de barras"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Código de barras: "),
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
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s es una marca estadounidense pero fue adquirida por Unilever (multinacional anglo-holandesa) en 2000. Por lo tanto, la marca no se considera estadounidense.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné es una marca francesa pero fue adquirida por el grupo estadounidense McCormick en 2000. Por lo tanto, la marca se considera estadounidense.",
    ),
    "cosmetique": MessageLookupByLibrary.simpleMessage("Cosmética"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Descripción corta del producto",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Descripción *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca no está presente en nuestra base de datos.",
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
    "gallery": MessageLookupByLibrary.simpleMessage("Galería"),
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
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ingrese una marca de alimentos",
    ),
    "originCountryHint": MessageLookupByLibrary.simpleMessage(
      "Ej: Francia, USA, China...",
    ),
    "originCountryLabelOptional": MessageLookupByLibrary.simpleMessage(
      "País de origen (Opcional)",
    ),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Nombre de la empresa propietaria",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage(
      "Empresa matriz",
    ),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Empresa matriz (Opcional)",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
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
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Haga clic aquí para reportar un problema",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Reportar un problema",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Describa el problema encontrado con el producto o la aplicación.",
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
      "¡Gracias! Su reporte ha sido enviado.",
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
    "safe": MessageLookupByLibrary.simpleMessage("NO USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este producto no parece provenir de una empresa estadounidense.",
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
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor, seleccione una foto.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Enviando imagen..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Enviando información...",
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
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "La información de texto se envió, pero falló la subida de la imagen.",
    ),
    "textSubmissionFailed": m1,
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
    "welcome": MessageLookupByLibrary.simpleMessage("Bienvenido a"),
  };
}
