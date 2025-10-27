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

  static String m1(error) => "Fout bij verzenden: ${error}";

  static String m2(value) => "${value} g";

  static String m3(details) => "Upload ingrediëntenfoto mislukt: ${details}";

  static String m4(value) => "${value} kcal";

  static String m5(group) => "Groep ${group}";

  static String m6(details) => "Upload voedingswaardefoto mislukt: ${details}";

  static String m7(statusCode) =>
      "Verzenden van tekstinformatie mislukt (status ${statusCode}). Controleer logs voor HTML-antwoord.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik hier om de info aan te vullen",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Informatie toevoegen",
    ),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Afbeelding van ingrediënten toevoegen",
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
    "additivesTitle": MessageLookupByLibrary.simpleMessage("Additieven"),
    "allergensTitle": MessageLookupByLibrary.simpleMessage("Allergeen"),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "Je alternatief is ingediend voor beoordeling",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Alternatieven"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scan de barcode van uw product om te zien of het merk eigendom is van een Amerikaans bedrijf.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scan barcode"),
    "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Barcode: "),
    "beauty": MessageLookupByLibrary.simpleMessage("Schoonheid"),
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
    "close": MessageLookupByLibrary.simpleMessage("Sluiten"),
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
    "considerAsAmericanIfLinkedToUSA": MessageLookupByLibrary.simpleMessage(
      "Als Amerikaans beschouwen als verbonden met de VS",
    ),
    "contribution": MessageLookupByLibrary.simpleMessage("Bijdrage"),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "U kunt de bijdragebedragen voor de Amerikaanse verkiezingen van 2024 vinden op de Open Secret-website.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Fout bij het opslaan van bijdragen.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Bedankt! Uw bijdragen zijn ter beoordeling ingediend en worden binnen 48 uur verwerkt.",
    ),
    "contributorModeInfo": MessageLookupByLibrary.simpleMessage(
      "Meer info over de bijdragermodus",
    ),
    "counter": MessageLookupByLibrary.simpleMessage("Teller"),
    "counterResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Teller succesvol gereset",
    ),
    "counterTitle": MessageLookupByLibrary.simpleMessage("VS Teller"),
    "countrySelectionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Herkomstlanden",
    ),
    "defectsTitle": MessageLookupByLibrary.simpleMessage("Defecten"),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Bedrag (Democraten)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Democratische Bijdragen",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Democraten"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Korte productbeschrijving",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Beschrijving *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Dit merk is niet aanwezig in onze database.",
    ),
    "display": MessageLookupByLibrary.simpleMessage("Weergave"),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Bewerken",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Bewerk de politieke bijdragen voor de Amerikaanse presidentsverkiezingen van 2024",
    ),
    "enableBoycottMode": MessageLookupByLibrary.simpleMessage(
      "Boycotmodus inschakelen",
    ),
    "enableContributorMode": MessageLookupByLibrary.simpleMessage(
      "Bijdragermodus inschakelen",
    ),
    "energyHigh": MessageLookupByLibrary.simpleMessage("Calorierijk"),
    "energyLow": MessageLookupByLibrary.simpleMessage("Lage calorische impact"),
    "energyMedium": MessageLookupByLibrary.simpleMessage(
      "Gemiddelde calorie-inname",
    ),
    "energyTitle": MessageLookupByLibrary.simpleMessage("Calorieën"),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Er is een fout opgetreden bij het toevoegen van het product.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Fout"),
    "fallbackProduct": MessageLookupByLibrary.simpleMessage("Product"),
    "fatHigh": MessageLookupByLibrary.simpleMessage("Hoog in vet"),
    "fatLow": MessageLookupByLibrary.simpleMessage("Laag in vet"),
    "fatMedium": MessageLookupByLibrary.simpleMessage("Gemiddeld vet"),
    "fatTitle": MessageLookupByLibrary.simpleMessage("Vetten"),
    "fiberHigh": MessageLookupByLibrary.simpleMessage("Hoog in vezels"),
    "fiberLow": MessageLookupByLibrary.simpleMessage("Laag in vezels"),
    "fiberMedium": MessageLookupByLibrary.simpleMessage("Enige vezels"),
    "fiberTitle": MessageLookupByLibrary.simpleMessage("Vezels"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Dit veld is verplicht.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Vul alstublieft alle velden in.",
    ),
    "followUsOnInstagram": MessageLookupByLibrary.simpleMessage(
      "Volg ons op Instagram",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Voedsel"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galerij"),
    "general": MessageLookupByLibrary.simpleMessage("Algemeen"),
    "gramsValue": m2,
    "healthLabel": MessageLookupByLibrary.simpleMessage("Gezondheid"),
    "however": MessageLookupByLibrary.simpleMessage("Echter"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Fout bij het selecteren van de afbeelding",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage("Kies een bron"),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("Afbeeldingsbron"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Fout bij het uploaden van de afbeelding.",
    ),
    "informationTitle": MessageLookupByLibrary.simpleMessage("Informatie"),
    "ingredientPhotoUploadFailed": m3,
    "ingredientsOptional": MessageLookupByLibrary.simpleMessage(
      "Ingrediënten (optioneel)",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Afkomst van ingrediënten",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Voer een geldig nummer in.",
    ),
    "kcalValue": m4,
    "languageSelection": MessageLookupByLibrary.simpleMessage(
      "Taal selecteren",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Voer een merk in",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Modus"),
    "naLabel": MessageLookupByLibrary.simpleMessage("N/B"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "Nog geen alternatieven.",
    ),
    "noHealthInfo": MessageLookupByLibrary.simpleMessage(
      "Geen gezondheidsinformatie beschikbaar",
    ),
    "noInfo": MessageLookupByLibrary.simpleMessage(
      "Geen informatie beschikbaar",
    ),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "Nog geen politieke bijdragen.",
    ),
    "novaGroup1Desc": MessageLookupByLibrary.simpleMessage(
      "Onbewerkte of minimaal bewerkte voedingsmiddelen",
    ),
    "novaGroup2Desc": MessageLookupByLibrary.simpleMessage(
      "Bewerkte culinaire ingrediënten",
    ),
    "novaGroup3Desc": MessageLookupByLibrary.simpleMessage(
      "Bewerkte voedingsmiddelen",
    ),
    "novaGroup4Desc": MessageLookupByLibrary.simpleMessage(
      "Ultra-bewerkte producten",
    ),
    "novaGroupAdditional": m5,
    "novaGroupTitle": MessageLookupByLibrary.simpleMessage("NOVA-groep"),
    "novaGroupUnknown": MessageLookupByLibrary.simpleMessage("Onbekende groep"),
    "nutritionPhotoUploadFailed": m6,
    "nutritionTablePhoto": MessageLookupByLibrary.simpleMessage(
      "Voedingswaardetabel",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "optionsTitle": MessageLookupByLibrary.simpleMessage("Opties"),
    "organicNo": MessageLookupByLibrary.simpleMessage("Niet biologisch"),
    "organicTitle": MessageLookupByLibrary.simpleMessage("Bio"),
    "organicYes": MessageLookupByLibrary.simpleMessage("Biologisch product"),
    "originLabel": MessageLookupByLibrary.simpleMessage("Land van herkomst"),
    "originOfIngredients": MessageLookupByLibrary.simpleMessage(
      "Oorsprong van ingrediënten",
    ),
    "other": MessageLookupByLibrary.simpleMessage("Overig"),
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
    "petFood": MessageLookupByLibrary.simpleMessage("Dierenvoeding"),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Politieke bijdragen 2024",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Voorkeuren"),
    "preferencesScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Voorkeuren",
    ),
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
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Stel een alternatief voor",
    ),
    "proteinsHigh": MessageLookupByLibrary.simpleMessage("Hoog in eiwitten"),
    "proteinsLow": MessageLookupByLibrary.simpleMessage("Laag in eiwitten"),
    "proteinsMedium": MessageLookupByLibrary.simpleMessage("Enige eiwitten"),
    "proteinsTitle": MessageLookupByLibrary.simpleMessage("Eiwitten"),
    "qualitiesTitle": MessageLookupByLibrary.simpleMessage("Kwaliteiten"),
    "reportProblem": MessageLookupByLibrary.simpleMessage("Meld een probleem"),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klik hier om een probleem te melden",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Probleem melden",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Uw opmerkingen",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Beschrijf het probleem met het product of de applicatie.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Voer uw e-mailadres in als u een follow-up wilt",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Voer een geldig e-mailadres in.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Uw e-mailadres (Optioneel)",
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
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Bedrag (Republikeinen)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Republikeinse Bijdragen",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Republikeinen"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetButton": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetCounter": MessageLookupByLibrary.simpleMessage("Teller resetten"),
    "resetSuccessSnack": MessageLookupByLibrary.simpleMessage(
      "Scores succesvol gereset",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NIET VS"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dit product lijkt niet afkomstig te zijn van een Amerikaans bedrijf.",
    ),
    "saltHigh": MessageLookupByLibrary.simpleMessage("Te zout"),
    "saltLow": MessageLookupByLibrary.simpleMessage("Laag in zout"),
    "saltMedium": MessageLookupByLibrary.simpleMessage("Gemiddeld zout"),
    "saltTitle": MessageLookupByLibrary.simpleMessage("Zout"),
    "saturatedFatHigh": MessageLookupByLibrary.simpleMessage(
      "Te veel verzadigd vet",
    ),
    "saturatedFatLow": MessageLookupByLibrary.simpleMessage(
      "Laag in verzadigd vet",
    ),
    "saturatedFatMedium": MessageLookupByLibrary.simpleMessage(
      "Gemiddelde verzadigde vetten",
    ),
    "saturatedFatTitle": MessageLookupByLibrary.simpleMessage(
      "Verzadigde vetten",
    ),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Bijdragen opslaan",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Bijdragen opslaan...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Scan een streepjescode",
    ),
    "scoresResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Scores succesvol gereset",
    ),
    "searchCountryPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Zoek naar een land",
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
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "Selecteer land(en)…",
    ),
    "selectIngredientPhotoError": MessageLookupByLibrary.simpleMessage(
      "Selecteer een foto voor de ingrediënten.",
    ),
    "selectNutritionPhotoError": MessageLookupByLibrary.simpleMessage(
      "Selecteer een foto voor de voedingswaardetabel.",
    ),
    "selectOriginCountries": MessageLookupByLibrary.simpleMessage(
      "Selecteer herkomstlanden",
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
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Instellingen"),
    "showTrumpHead": MessageLookupByLibrary.simpleMessage("Toon Trumps hoofd"),
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
    "sugarsHigh": MessageLookupByLibrary.simpleMessage("Te zoet"),
    "sugarsLow": MessageLookupByLibrary.simpleMessage("Laag in suikers"),
    "sugarsMedium": MessageLookupByLibrary.simpleMessage("Gemiddelde suikers"),
    "sugarsTitle": MessageLookupByLibrary.simpleMessage("Suikers"),
    "supportCommunity": MessageLookupByLibrary.simpleMessage(
      "Ondersteuning & community",
    ),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Tekstinformatie is verzonden, maar het uploaden van de afbeelding is mislukt.",
    ),
    "textSubmissionFailed": m7,
    "unableToOpenInstagram": MessageLookupByLibrary.simpleMessage(
      "Kan Instagram niet openen",
    ),
    "unableToOpenLink": MessageLookupByLibrary.simpleMessage(
      "Kan link niet openen",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("ONBEKEND"),
    "unknownData": MessageLookupByLibrary.simpleMessage(
      "Gegevens niet beschikbaar",
    ),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Het gezochte product is niet gevonden in onze database.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("VS"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dit product is afkomstig van een Amerikaans bedrijf!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Valideren"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Bekijk criteria"),
    "visitWebsite": MessageLookupByLibrary.simpleMessage("Bezoek onze website"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welkom bij"),
    "xPrefix": MessageLookupByLibrary.simpleMessage("x"),
  };
}
