// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nl locale. All the
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
  String get localeName => 'nl';

  static String m0(barcode) =>
      "Geef ontbrekende details voor barcode: ${barcode}";

  static String m1(statusCode) =>
      "Verzenden van tekstinformatie mislukt (status ${statusCode}). Controleer logs voor HTML-antwoord.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik hier om de info aan te vullen",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Informatie toevoegen",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Foto toevoegen"),
    "addProductButton": MessageLookupByLibrary.simpleMessage(
      "Product toevoegen",
    ),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Help ons door een product aan de database toe te voegen",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Informatie toevoegen",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Fout bij het verzenden van informatie. Probeer het opnieuw.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Productinformatie aanvullen",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Bedankt! Productinformatie toegevoegd.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Informatie toevoegen",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Product toevoegen",
    ),
    "alimentation": MessageLookupByLibrary.simpleMessage("Voeding"),
    "alimentationAnimaux": MessageLookupByLibrary.simpleMessage(
      "Dierenvoeding",
    ),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scan de barcode van uw product om te zien of het merk eigendom is van een Amerikaans bedrijf.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan barcode"),
    "autre": MessageLookupByLibrary.simpleMessage("Overig"),
    "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Barcode: "),
    "brandHint": MessageLookupByLibrary.simpleMessage("Hoofdmerknaam"),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Merk *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Merknaam"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Bijv.: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Merk niet gevonden"),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuleren"),
    "category": MessageLookupByLibrary.simpleMessage("Categorie"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik hier om onze criteria te ontdekken",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Hoe worden bedrijven geclassificeerd?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Een merk wordt als Amerikaans beschouwd als het tot een Amerikaanse groep behoort.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Criteria Amerikaans bedrijf",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Bedrijf"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s is een Amerikaans merk, maar werd in 2000 overgenomen door Unilever (een Brits-Nederlandse multinational). Het merk wordt dus niet als Amerikaans beschouwd.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné is een Frans merk, maar werd in 2000 overgenomen door de Amerikaanse groep McCormick. Het merk wordt dus als Amerikaans beschouwd.",
    ),
    "cosmetique": MessageLookupByLibrary.simpleMessage("Cosmetica"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Korte productbeschrijving",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Beschrijving *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Dit merk is niet aanwezig in onze database.",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Er is een fout opgetreden bij het toevoegen van het product.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Fout"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Dit veld is verplicht.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Vul alstublieft alle velden in.",
    ),
    "gallery": MessageLookupByLibrary.simpleMessage("Galerij"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Fout bij het selecteren van de afbeelding",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage("Kies een bron"),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("Afbeeldingsbron"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Fout bij het uploaden van de afbeelding.",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Voer een voedingsmerk in",
    ),
    "originLabel": MessageLookupByLibrary.simpleMessage("Land van herkomst"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Naam van het eigenaarsbedrijf",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage("Moederbedrijf"),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Moederbedrijf (Optioneel)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Bijv.: Frankrijk, VS, China...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Land van herkomst van het moederbedrijf (Optioneel)",
    ),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "We kunnen fouten maken. Als u er een ziet, stuur ons dan een e-mail met de merknaam zodat we onze lijst kunnen bijwerken.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Een probleem met een product?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Product en afbeelding succesvol toegevoegd!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Productnaam"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Voer de productnaam in",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Product niet gevonden",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik hier om een probleem te melden",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Probleem melden",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Beschrijf het probleem met het product of de applicatie.",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Fout bij het verzenden van het rapport. Probeer het opnieuw.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Help ons de applicatie te verbeteren",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Beschrijf het probleem of de fout...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Rapport verzenden",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Bedankt! Uw rapport is verzonden.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Probleem melden",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Beschrijf alstublieft het probleem.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Geef alstublieft meer details (min. 10 tekens).",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NIET VS"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dit product lijkt niet afkomstig te zijn van een Amerikaans bedrijf.",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Zorg ervoor dat u een correct gespeld voedingsmerk invoert om fouten te voorkomen.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Selecteer een categorie",
    ),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Selecteer alstublieft een categorie.",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Selecteer alstublieft een foto.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage(
      "Afbeelding verzenden...",
    ),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Informatie verzenden...",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Bron niet gevonden",
    ),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Fout tijdens het verzenden.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Product succesvol toegevoegd!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Succes"),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Tekstinformatie is verzonden, maar het uploaden van de afbeelding is mislukt.",
    ),
    "textSubmissionFailed": m1,
    "unknown": MessageLookupByLibrary.simpleMessage("ONBEKEND"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Het gezochte product is niet gevonden in onze database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("VS"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dit product is afkomstig van een Amerikaans bedrijf!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Valideren"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Bekijk criteria"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welkom bij"),
  };
}
