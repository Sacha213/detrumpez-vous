// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a da locale. All the
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
  String get localeName => 'da';

  static String m0(barcode) =>
      "Angiv manglende detaljer for stregkode: ${barcode}";

  static String m1(error) => "Fejl ved afsendelse: ${error}";

  static String m2(statusCode) =>
      "Kunne ikke sende tekstinformation (status ${statusCode}). Tjek logfiler for HTML-svar.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik her for at udfylde oplysningerne",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage("Tilføj information"),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Tilføj billede af ingredienser",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Tilføj et foto"),
    "addProductButton": MessageLookupByLibrary.simpleMessage("Tilføj produkt"),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Hjælp os ved at tilføje et produkt til databasen",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Tilføj information",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Fejl ved afsendelse af information. Prøv venligst igen.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Udfyld produktinformation",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Tak! Dine produktinformationer er blevet sendt til gennemgang og vil blive tilføjet inden for 48 timer.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Tilføj information",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Tilføj et produkt",
    ),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "Tak! Dit alternativ er blevet sendt til gennemgang og vil blive behandlet inden for 48 timer.",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Alternativer"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scan stregkoden på dit produkt for at finde ud af, om mærket ejes af et amerikansk firma.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan stregkode"),
    "barcode": MessageLookupByLibrary.simpleMessage("Stregkode"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Stregkode: "),
    "beauty": MessageLookupByLibrary.simpleMessage("Skønhed"),
    "brandHint": MessageLookupByLibrary.simpleMessage("Hovedmærkenavn"),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Mærke *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Mærkenavn"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "F.eks.: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Mærke ikke fundet"),
    "camera": MessageLookupByLibrary.simpleMessage("Kamera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuller"),
    "category": MessageLookupByLibrary.simpleMessage("Kategori"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik her for at opdage vores kriterier",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Hvordan klassificeres firmaer?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Et mærke betragtes som amerikansk, hvis det tilhører en amerikansk koncern.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Kriterier for amerikanske firmaer",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Firma"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s er et amerikansk mærke, men blev opkøbt af Unilever (en anglo-hollandsk multinational) i 2000. Derfor betragtes mærket ikke som amerikansk.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné er et fransk mærke, men blev opkøbt af den amerikanske koncern McCormick i 2000. Derfor betragtes mærket som amerikansk.",
    ),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "Du kan finde bidragsbeløbene til det amerikanske valg 2024 på Open Secret-webstedet.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Fejl ved gemning af bidrag.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Tak! Dine bidrag er blevet sendt til gennemgang og vil blive behandlet inden for 48 timer.",
    ),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Beløb (Demokrater)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Demokratiske bidrag",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Demokrater"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Kort produktbeskrivelse",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Beskrivelse *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Dette mærke findes ikke i vores database.",
    ),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Rediger",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Rediger de politiske bidrag til det amerikanske præsidentvalg 2024",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Der opstod en fejl under tilføjelsen af produktet.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Fejl"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Dette felt er påkrævet.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Udfyld venligst alle felter.",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Mad"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galleri"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Fejl ved valg af billede",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage("Vælg en kilde"),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("Billedkilde"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Fejl ved upload af billede.",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Ingrediensernes oprindelse",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Indtast venligst et gyldigt nummer.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Indtast et mærke",
    ),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "Ingen alternativer endnu.",
    ),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "Ingen politiske bidrag endnu.",
    ),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "originLabel": MessageLookupByLibrary.simpleMessage("Oprindelsesland"),
    "other": MessageLookupByLibrary.simpleMessage("Andet"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Navn på ejerselskab",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage("Moderselskab"),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Moderselskab (valgfrit)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "F.eks.: Frankrig, USA, Kina...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Moderselskabets oprindelsesland (valgfrit)",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("Dyrefoder"),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Politiske bidrag 2024",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Vi kan lave fejl. Hvis du opdager en, så send os venligst mærkenavnet via e-mail, så vi kan opdatere vores liste.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Et problem med et produkt?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Produkt og billede tilføjet med succes!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Produktnavn"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Indtast produktnavnet",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produkt ikke fundet",
    ),
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Foreslå et alternativ",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik her for at rapportere et problem",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Rapporter et problem",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Dine kommentarer",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Beskriv problemet med produktet eller applikationen.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Indtast din e-mail, hvis du ønsker opfølgning",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Indtast venligst en gyldig e-mailadresse.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Din e-mail (valgfrit)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Fejl ved afsendelse af rapport. Prøv venligst igen.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Hjælp os med at forbedre applikationen",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Beskriv problemet eller fejlen...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Send rapport",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Tak! Din rapport er blevet sendt til gennemgang og vil blive behandlet inden for 48 timer.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Rapporter et problem",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Beskriv venligst problemet.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Giv venligst flere detaljer (mindst 10 tegn).",
    ),
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Beløb (Republikanere)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Republikanske bidrag",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Republikanere"),
    "safe": MessageLookupByLibrary.simpleMessage("IKKE USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dette produkt ser ikke ud til at komme fra et amerikansk firma.",
    ),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Gem bidrag",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Gemmer bidrag...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Scan en stregkode",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Sørg for at indtaste et korrekt stavet fødevaremærke for at undgå fejl.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage("Vælg en kategori"),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Vælg venligst en kategori.",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Vælg venligst et billede.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage("Sender billede..."),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Sender information...",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage("Kilde ikke fundet"),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Fejl under indsendelse.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Produkt tilføjet med succes!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Succes"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Tekstinformation blev sendt, men billedupload mislykkedes.",
    ),
    "textSubmissionFailed": m2,
    "unknown": MessageLookupByLibrary.simpleMessage("UKENDT"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Det produkt, du søgte efter, blev ikke fundet i vores database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dette produkt kommer fra et amerikansk firma!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Bekræft"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Se kriterier"),
    "welcome": MessageLookupByLibrary.simpleMessage("Velkommen til"),
  };
}
