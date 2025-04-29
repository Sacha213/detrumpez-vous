// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(barcode) =>
      "Forneça os detalhes em falta para o código de barras: ${barcode}";

  static String m1(statusCode) =>
      "Falha ao enviar informações de texto (status ${statusCode}). Verifique os logs para a resposta HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clique aqui para completar as informações",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Adicionar informações",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Adicionar uma foto"),
    "addProductButton": MessageLookupByLibrary.simpleMessage(
      "Adicionar produto",
    ),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Ajude-nos adicionando um produto à base de dados",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Adicionar informações",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Erro ao enviar informações. Por favor, tente novamente.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Completar informações do produto",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Obrigado! Informações do produto adicionadas.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Adicionar informações",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Adicionar um produto",
    ),
    "alimentation": MessageLookupByLibrary.simpleMessage("Alimentos"),
    "alimentationAnimaux": MessageLookupByLibrary.simpleMessage(
      "Alimentos para animais",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Digitalize o código de barras do seu produto para descobrir se a marca pertence a uma empresa americana.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Digitalizar código de barras",
    ),
    "autre": MessageLookupByLibrary.simpleMessage("Outro"),
    "barcode": MessageLookupByLibrary.simpleMessage("Código de barras"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Código de barras: "),
    "brandHint": MessageLookupByLibrary.simpleMessage(
      "Nome da marca principal",
    ),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Marca *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Nome da marca"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ex: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marca não encontrada",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Câmera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "category": MessageLookupByLibrary.simpleMessage("Categoria"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clique aqui para descobrir nossos critérios",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Como as empresas são classificadas?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Uma marca é considerada americana se pertencer a um grupo americano.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Critérios de Empresa Americana",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Empresa"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s é uma marca americana, mas foi adquirida pela Unilever (multinacional anglo-holandesa) em 2000. Assim, a marca não é considerada americana.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné é uma marca francesa, mas foi adquirida pelo grupo americano McCormick em 2000. Assim, a marca é considerada americana.",
    ),
    "cosmetique": MessageLookupByLibrary.simpleMessage("Cosméticos"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Breve descrição do produto",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Descrição *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca não está presente na nossa base de dados.",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Ocorreu um erro ao adicionar o produto.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Erro"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Este campo é obrigatório.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Por favor, preencha todos os campos.",
    ),
    "gallery": MessageLookupByLibrary.simpleMessage("Galeria"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Erro ao selecionar a imagem",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage(
      "Escolha uma fonte",
    ),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("Fonte da imagem"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Erro ao carregar a imagem.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Digite uma marca de alimentos",
    ),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Nome da empresa proprietária",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage("Empresa-mãe"),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Empresa-mãe (Opcional)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Ex: França, EUA, China...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "País de origem (Opcional)",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Podemos cometer erros. Se encontrar um, envie-nos um e-mail com o nome da marca para que possamos atualizar nossa lista.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Um problema com um produto?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Produto e imagem adicionados com sucesso!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Nome do produto"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Digite o nome do produto",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produto não encontrado",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clique aqui para reportar um problema",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Reportar um problema",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Descreva o problema encontrado com o produto ou aplicação.",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Erro ao enviar o relatório. Por favor, tente novamente.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Ajude-nos a melhorar a aplicação",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Descreva o problema ou erro...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Enviar relatório",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Obrigado! Seu relatório foi enviado.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Reportar um problema",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Por favor, descreva o problema.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Por favor, forneça mais detalhes (mín. 10 caracteres).",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NÃO EUA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este produto não parece vir de uma empresa americana.",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Certifique-se de digitar uma marca de alimentos corretamente escrita para evitar erros.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Selecione uma categoria",
    ),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Por favor, selecione uma categoria.",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor, selecione uma foto.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Enviando imagem..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Enviando informações...",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Fonte não encontrada",
    ),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Erro durante o envio.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Produto adicionado com sucesso!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Sucesso"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "As informações de texto foram enviadas, mas o carregamento da imagem falhou.",
    ),
    "textSubmissionFailed": m1,
    "unknown": MessageLookupByLibrary.simpleMessage("DESCONHECIDO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "O produto que você pesquisou não foi encontrado em nossa base de dados.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("EUA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este produto vem de uma empresa americana!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validar"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Ver critérios"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bem-vindo a"),
  };
}
