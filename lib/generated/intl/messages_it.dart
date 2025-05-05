// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
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
  String get localeName => 'it';

  static String m0(barcode) =>
      "Fornisci i dettagli mancanti per il codice a barre: ${barcode}";

  static String m1(statusCode) =>
      "Invio informazioni di testo non riuscito (stato ${statusCode}). Controlla i log per la risposta HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clicca qui per completare le informazioni",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Aggiungi informazioni",
    ),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Aggiungi foto degli ingredienti",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Aggiungi una foto"),
    "addProductButton": MessageLookupByLibrary.simpleMessage(
      "Aggiungi prodotto",
    ),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Aiutaci aggiungendo un prodotto al database",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Aggiungi informazioni",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Errore durante l\'invio delle informazioni. Si prega di riprovare.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Completa informazioni prodotto",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Grazie! Informazioni prodotto aggiunte.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Aggiungi informazioni",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Aggiungi un prodotto",
    ),
    "alimentation": MessageLookupByLibrary.simpleMessage("Alimentari"),
    "alimentationAnimaux": MessageLookupByLibrary.simpleMessage(
      "Alimenti per animali",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scansiona il codice a barre del tuo prodotto per scoprire se il marchio è di proprietà di un\'azienda americana.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "Scansiona codice a barre",
    ),
    "autre": MessageLookupByLibrary.simpleMessage("Altro"),
    "barcode": MessageLookupByLibrary.simpleMessage("Codice a barre"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Codice a barre: "),
    "brandHint": MessageLookupByLibrary.simpleMessage(
      "Nome del marchio principale",
    ),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Marchio *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Nome del marchio"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Es: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marchio non trovato",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Fotocamera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annulla"),
    "category": MessageLookupByLibrary.simpleMessage("Categoria"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clicca qui per scoprire i nostri criteri",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Come vengono classificate le aziende?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Un marchio è considerato americano se appartiene a un gruppo americano.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Criteri azienda americana",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Azienda"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s è un marchio americano ma è stato acquisito da Unilever (multinazionale anglo-olandese) nel 2000. Pertanto, il marchio non è considerato americano.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné è un marchio francese ma è stato acquisito dal gruppo americano McCormick nel 2000. Pertanto, il marchio è considerato americano.",
    ),
    "cosmetique": MessageLookupByLibrary.simpleMessage("Cosmetici"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Breve descrizione del prodotto",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Descrizione *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Questo marchio non è presente nel nostro database.",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Si è verificato un errore durante l\'aggiunta del prodotto.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Errore"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Questo campo è obbligatorio.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Si prega di compilare tutti i campi.",
    ),
    "gallery": MessageLookupByLibrary.simpleMessage("Galleria"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Errore nella selezione dell\'immagine",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage(
      "Scegli una fonte",
    ),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("Fonte immagine"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Errore durante il caricamento dell\'immagine.",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Origine degli ingredienti",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Inserisci un marchio alimentare",
    ),
    "originLabel": MessageLookupByLibrary.simpleMessage("Paese di origine"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Nome della società proprietaria",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage("Società madre"),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Società madre (Opzionale)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Es: Francia, USA, Cina...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Paese di origine della società madre (Facoltativo)",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Possiamo commettere errori. Se ne trovi uno, inviaci un\'e-mail con il nome del marchio in modo che possiamo aggiornare il nostro elenco.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Un problema con un prodotto?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Prodotto e immagine aggiunti con successo!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Nome del prodotto"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Inserisci il nome del prodotto",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Prodotto non trovato",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Clicca qui per segnalare un problema",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Segnala un problema",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Descrivi il problema riscontrato con il prodotto o l\'applicazione.",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Errore durante l\'invio della segnalazione. Si prega di riprovare.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Aiutaci a migliorare l\'applicazione",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Descrivi il problema o l\'errore...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Invia segnalazione",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Grazie! La tua segnalazione è stata inviata.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Segnala un problema",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Si prega di descrivere il problema.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Si prega di fornire maggiori dettagli (min. 10 caratteri).",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NON USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Questo prodotto non sembra provenire da un\'azienda americana.",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Scansiona un codice a barre",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Assicurati di inserire un marchio alimentare scritto correttamente per evitare errori.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Seleziona una categoria",
    ),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Si prega di selezionare una categoria.",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Si prega di selezionare una foto.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Invio immagine..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Invio informazioni...",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Fonte non trovata"),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Errore durante l\'invio.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Prodotto aggiunto con successo!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Successo"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Le informazioni di testo sono state inviate, ma il caricamento dell\'immagine è fallito.",
    ),
    "textSubmissionFailed": m1,
    "unknown": MessageLookupByLibrary.simpleMessage("SCONOSCIUTO"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Il prodotto che hai cercato non è stato trovato nel nostro database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Questo prodotto proviene da un\'azienda americana!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Convalida"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Vedi criteri"),
    "welcome": MessageLookupByLibrary.simpleMessage("Benvenuto in"),
  };
}
