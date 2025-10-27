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

  static String m1(error) => "Erro ao enviar: ${error}";

  static String m2(value) => "${value} g";

  static String m3(details) =>
      "Falha ao enviar a foto dos ingredientes: ${details}";

  static String m4(value) => "${value} kcal";

  static String m5(group) => "Grupo ${group}";

  static String m6(details) => "Falha ao enviar a foto nutricional: ${details}";

  static String m7(statusCode) =>
      "Falha ao enviar informações de texto (status ${statusCode}). Verifique os logs para a resposta HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clique aqui para completar as informações",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Adicionar informações",
    ),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Adicionar foto dos ingredientes",
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
    "additivesTitle": MessageLookupByLibrary.simpleMessage("Aditivos"),
    "allergensTitle": MessageLookupByLibrary.simpleMessage("Alergênios"),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "Sua alternativa foi enviada para revisão",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Alternativas"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Digitalize o código de barras do seu produto para descobrir se a marca pertence a uma empresa americana.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Digitalizar código de barras",
    ),
    "barcode": MessageLookupByLibrary.simpleMessage("Código de barras"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Código de barras: "),
    "beauty": MessageLookupByLibrary.simpleMessage("Beleza"),
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
    "close": MessageLookupByLibrary.simpleMessage("Fechar"),
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
    "considerAsAmericanIfLinkedToUSA": MessageLookupByLibrary.simpleMessage(
      "Considerar como americano se vinculado aos EUA",
    ),
    "contribution": MessageLookupByLibrary.simpleMessage("Contribuição"),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "Você pode encontrar os valores das contribuições para a eleição dos EUA de 2024 no site Open Secret.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Erro ao salvar as contribuições.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Obrigado! Suas contribuições foram enviadas para revisão e serão processadas dentro de 48 horas.",
    ),
    "contributorModeInfo": MessageLookupByLibrary.simpleMessage(
      "Mais informações sobre o modo colaborador",
    ),
    "counter": MessageLookupByLibrary.simpleMessage("Contador"),
    "counterResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Contador redefinido com sucesso",
    ),
    "counterTitle": MessageLookupByLibrary.simpleMessage("Contador EUA"),
    "countrySelectionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Países de origem",
    ),
    "defectsTitle": MessageLookupByLibrary.simpleMessage("Defeitos"),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Montante (Democratas)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Contribuições Democratas",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Democratas"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Breve descrição do produto",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Descrição *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Esta marca não está presente na nossa base de dados.",
    ),
    "display": MessageLookupByLibrary.simpleMessage("Exibição"),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Editar",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Editar as contribuições políticas para a eleição presidencial americana de 2024",
    ),
    "enableBoycottMode": MessageLookupByLibrary.simpleMessage(
      "Ativar modo boicote",
    ),
    "enableContributorMode": MessageLookupByLibrary.simpleMessage(
      "Ativar modo colaborador",
    ),
    "energyHigh": MessageLookupByLibrary.simpleMessage("Denso em calorias"),
    "energyLow": MessageLookupByLibrary.simpleMessage("Baixo impacto calórico"),
    "energyMedium": MessageLookupByLibrary.simpleMessage(
      "Ingestão calórica moderada",
    ),
    "energyTitle": MessageLookupByLibrary.simpleMessage("Calorias"),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Ocorreu um erro ao adicionar o produto.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Erro"),
    "fallbackProduct": MessageLookupByLibrary.simpleMessage("Produto"),
    "fatHigh": MessageLookupByLibrary.simpleMessage("Alto em gorduras"),
    "fatLow": MessageLookupByLibrary.simpleMessage("Baixo em gorduras"),
    "fatMedium": MessageLookupByLibrary.simpleMessage("Gorduras moderadas"),
    "fatTitle": MessageLookupByLibrary.simpleMessage("Gorduras"),
    "fiberHigh": MessageLookupByLibrary.simpleMessage("Alto em fibra"),
    "fiberLow": MessageLookupByLibrary.simpleMessage("Baixo em fibra"),
    "fiberMedium": MessageLookupByLibrary.simpleMessage("Alguma fibra"),
    "fiberTitle": MessageLookupByLibrary.simpleMessage("Fibra"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Este campo é obrigatório.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Por favor, preencha todos os campos.",
    ),
    "followUsOnInstagram": MessageLookupByLibrary.simpleMessage(
      "Siga-nos no Instagram",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Alimentos"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galeria"),
    "general": MessageLookupByLibrary.simpleMessage("Geral"),
    "gramsValue": m2,
    "healthLabel": MessageLookupByLibrary.simpleMessage("Saúde"),
    "however": MessageLookupByLibrary.simpleMessage("No entanto"),
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
    "informationTitle": MessageLookupByLibrary.simpleMessage("Informações"),
    "ingredientPhotoUploadFailed": m3,
    "ingredientsOptional": MessageLookupByLibrary.simpleMessage(
      "Ingredientes (opcional)",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Origem dos ingredientes",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Por favor, insira um número válido.",
    ),
    "kcalValue": m4,
    "languageSelection": MessageLookupByLibrary.simpleMessage(
      "Seleção de idioma",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Insira uma marca",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Modo"),
    "naLabel": MessageLookupByLibrary.simpleMessage("N/D"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "Ainda não há alternativas.",
    ),
    "noHealthInfo": MessageLookupByLibrary.simpleMessage(
      "Nenhuma informação de saúde disponível",
    ),
    "noInfo": MessageLookupByLibrary.simpleMessage(
      "Nenhuma informação disponível",
    ),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "Nenhuma contribuição política até agora.",
    ),
    "novaGroup1Desc": MessageLookupByLibrary.simpleMessage(
      "Alimentos não processados ou minimamente processados",
    ),
    "novaGroup2Desc": MessageLookupByLibrary.simpleMessage(
      "Ingredientes culinários processados",
    ),
    "novaGroup3Desc": MessageLookupByLibrary.simpleMessage(
      "Alimentos processados",
    ),
    "novaGroup4Desc": MessageLookupByLibrary.simpleMessage(
      "Produtos ultraprocessados",
    ),
    "novaGroupAdditional": m5,
    "novaGroupTitle": MessageLookupByLibrary.simpleMessage("Grupo NOVA"),
    "novaGroupUnknown": MessageLookupByLibrary.simpleMessage(
      "Grupo desconhecido",
    ),
    "nutritionPhotoUploadFailed": m6,
    "nutritionTablePhoto": MessageLookupByLibrary.simpleMessage(
      "Tabela nutricional",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "optionsTitle": MessageLookupByLibrary.simpleMessage("Opções"),
    "organicNo": MessageLookupByLibrary.simpleMessage("Não orgânico"),
    "organicTitle": MessageLookupByLibrary.simpleMessage("Orgânico"),
    "organicYes": MessageLookupByLibrary.simpleMessage("Produto orgânico"),
    "originLabel": MessageLookupByLibrary.simpleMessage("País de origem"),
    "originOfIngredients": MessageLookupByLibrary.simpleMessage(
      "Origem dos ingredientes",
    ),
    "other": MessageLookupByLibrary.simpleMessage("Outro"),
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
      "País de origem da empresa controladora (Opcional)",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("Ração para animais"),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Contribuições políticas 2024",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Preferências"),
    "preferencesScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Preferências",
    ),
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
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Propor uma alternativa",
    ),
    "proteinsHigh": MessageLookupByLibrary.simpleMessage("Alto em proteínas"),
    "proteinsLow": MessageLookupByLibrary.simpleMessage("Baixo em proteínas"),
    "proteinsMedium": MessageLookupByLibrary.simpleMessage("Algumas proteínas"),
    "proteinsTitle": MessageLookupByLibrary.simpleMessage("Proteínas"),
    "qualitiesTitle": MessageLookupByLibrary.simpleMessage("Qualidades"),
    "reportProblem": MessageLookupByLibrary.simpleMessage(
      "Reportar um problema",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clique aqui para reportar um problema",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Reportar um problema",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Seus comentários",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Descreva o problema encontrado com o produto ou aplicação.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Digite seu e-mail se desejar um acompanhamento",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Por favor, insira um endereço de e-mail válido.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Seu e-mail (Opcional)",
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
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Montante (Republicanos)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Contribuições Republicanas",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Republicanos"),
    "reset": MessageLookupByLibrary.simpleMessage("Redefinir"),
    "resetButton": MessageLookupByLibrary.simpleMessage("Redefinir"),
    "resetCounter": MessageLookupByLibrary.simpleMessage("Redefinir contador"),
    "resetSuccessSnack": MessageLookupByLibrary.simpleMessage(
      "Pontuações redefinidas com sucesso",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NÃO EUA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este produto não parece vir de uma empresa americana.",
    ),
    "saltHigh": MessageLookupByLibrary.simpleMessage("Muito salgado"),
    "saltLow": MessageLookupByLibrary.simpleMessage("Baixo em sal"),
    "saltMedium": MessageLookupByLibrary.simpleMessage("Sal moderado"),
    "saltTitle": MessageLookupByLibrary.simpleMessage("Sal"),
    "saturatedFatHigh": MessageLookupByLibrary.simpleMessage(
      "Muitas gorduras saturadas",
    ),
    "saturatedFatLow": MessageLookupByLibrary.simpleMessage(
      "Baixo em gorduras saturadas",
    ),
    "saturatedFatMedium": MessageLookupByLibrary.simpleMessage(
      "Gorduras saturadas moderadas",
    ),
    "saturatedFatTitle": MessageLookupByLibrary.simpleMessage(
      "Gorduras saturadas",
    ),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Salvar Contribuições",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Salvando contribuições...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Escaneie um código de barras",
    ),
    "scoresResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Pontuações redefinidas com sucesso",
    ),
    "searchCountryPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Pesquisar país",
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
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "Selecione país(es)…",
    ),
    "selectIngredientPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor, selecione uma foto dos ingredientes.",
    ),
    "selectNutritionPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor, selecione uma foto da tabela nutricional.",
    ),
    "selectOriginCountries": MessageLookupByLibrary.simpleMessage(
      "Selecione países de origem",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Por favor, selecione uma foto.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Enviando imagem..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Enviando informações...",
    ),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Configurações"),
    "showTrumpHead": MessageLookupByLibrary.simpleMessage(
      "Mostrar a cabeça de Trump",
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
    "sugarsHigh": MessageLookupByLibrary.simpleMessage("Muito açucarado"),
    "sugarsLow": MessageLookupByLibrary.simpleMessage("Baixo em açúcares"),
    "sugarsMedium": MessageLookupByLibrary.simpleMessage("Açúcares moderados"),
    "sugarsTitle": MessageLookupByLibrary.simpleMessage("Açúcares"),
    "supportCommunity": MessageLookupByLibrary.simpleMessage(
      "Suporte e comunidade",
    ),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "As informações de texto foram enviadas, mas o carregamento da imagem falhou.",
    ),
    "textSubmissionFailed": m7,
    "unableToOpenInstagram": MessageLookupByLibrary.simpleMessage(
      "Não foi possível abrir o Instagram",
    ),
    "unableToOpenLink": MessageLookupByLibrary.simpleMessage(
      "Não foi possível abrir o link",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("DESCONHECIDO"),
    "unknownData": MessageLookupByLibrary.simpleMessage("Dados indisponíveis"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "O produto que você pesquisou não foi encontrado em nossa base de dados.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("EUA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Este produto vem de uma empresa americana!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validar"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Ver critérios"),
    "visitWebsite": MessageLookupByLibrary.simpleMessage("Visitar nosso site"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bem-vindo a"),
    "xPrefix": MessageLookupByLibrary.simpleMessage("x"),
  };
}
