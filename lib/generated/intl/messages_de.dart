// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(barcode) =>
      "Geben Sie fehlende Details für Barcode an: ${barcode}";

  static String m1(error) => "Fehler beim Senden: ${error}";

  static String m2(details) =>
      "Upload des Zutatenfotos fehlgeschlagen: ${details}";

  static String m3(details) =>
      "Upload des Nährwertfotos fehlgeschlagen: ${details}";

  static String m4(statusCode) =>
      "Fehler beim Senden der Textinformationen (Status ${statusCode}). Überprüfen Sie die Logs für die HTML-Antwort.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klicken Sie hier, um die Informationen zu vervollständigen",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Informationen hinzufügen",
    ),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Foto der Zutaten hinzufügen",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Foto hinzufügen"),
    "addProductButton": MessageLookupByLibrary.simpleMessage(
      "Produkt hinzufügen",
    ),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Helfen Sie uns, indem Sie ein Produkt zur Datenbank hinzufügen",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Informationen hinzufügen",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Senden der Informationen. Bitte versuchen Sie es erneut.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Produktinformationen vervollständigen",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Vielen Dank! Ihre Produktinformationen wurden zur Überprüfung eingereicht und werden innerhalb von 48 Stunden hinzugefügt.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Informationen hinzufügen",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Produkt hinzufügen",
    ),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "Vielen Dank! Ihre Alternative wurde zur Überprüfung eingereicht und wird innerhalb von 48 Stunden bearbeitet.",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Alternativen"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scannen Sie den Barcode Ihres Produkts, um herauszufinden, ob die Marke einem amerikanischen Unternehmen gehört.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Barcode scannen"),
    "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Barcode: "),
    "beauty": MessageLookupByLibrary.simpleMessage("Schönheit"),
    "brandHint": MessageLookupByLibrary.simpleMessage("Hauptmarkenname"),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Marke *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Markenname"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Z.B.: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage(
      "Marke nicht gefunden",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Kamera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "category": MessageLookupByLibrary.simpleMessage("Kategorie"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klicken Sie hier, um unsere Kriterien zu entdecken",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Wie werden Unternehmen klassifiziert?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Eine Marke gilt als amerikanisch, wenn sie zu einem amerikanischen Konzern gehört.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Kriterien für amerikanische Unternehmen",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Unternehmen"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & Jerry\'s ist eine amerikanische Marke, wurde aber im Jahr 2000 von Unilever (einem britisch-niederländischen multinationalen Konzern) übernommen. Daher gilt die Marke nicht als amerikanisch.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné ist eine französische Marke, wurde aber im Jahr 2000 von der amerikanischen Gruppe McCormick übernommen. Daher gilt die Marke als amerikanisch.",
    ),
    "considerAsAmericanIfLinkedToUSA": MessageLookupByLibrary.simpleMessage(
      "Als amerikanisch betrachten, wenn mit den USA verknüpft",
    ),
    "contribution": MessageLookupByLibrary.simpleMessage("Beitrag"),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "Sie finden die Beitragssummen für die US-Wahl 2024 auf der Website Open Secret.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Speichern der Beiträge.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Vielen Dank! Ihre Beiträge wurden zur Überprüfung eingereicht und werden innerhalb von 48 Stunden bearbeitet.",
    ),
    "contributorModeInfo": MessageLookupByLibrary.simpleMessage(
      "Weitere Infos zum Beitragsmodus",
    ),
    "counter": MessageLookupByLibrary.simpleMessage("Zähler"),
    "counterResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Zähler erfolgreich zurückgesetzt",
    ),
    "countrySelectionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Herkunftsländer",
    ),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Betrag (Demokraten)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Demokratische Beiträge",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Demokraten"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Kurze Produktbeschreibung",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Beschreibung *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Diese Marke ist nicht in unserer Datenbank vorhanden.",
    ),
    "display": MessageLookupByLibrary.simpleMessage("Anzeige"),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Bearbeiten",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Bearbeiten Sie die politischen Beiträge für die US-Präsidentschaftswahl 2024",
    ),
    "enableBoycottMode": MessageLookupByLibrary.simpleMessage(
      "Boykottmodus aktivieren",
    ),
    "enableContributorMode": MessageLookupByLibrary.simpleMessage(
      "Beitragsmodus aktivieren",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Beim Hinzufügen des Produkts ist ein Fehler aufgetreten.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Fehler"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Dieses Feld ist erforderlich.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Bitte füllen Sie alle Felder aus.",
    ),
    "followUsOnInstagram": MessageLookupByLibrary.simpleMessage(
      "Folge uns auf Instagram",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Lebensmittel"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galerie"),
    "general": MessageLookupByLibrary.simpleMessage("Allgemein"),
    "however": MessageLookupByLibrary.simpleMessage("Allerdings"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Fehler bei der Bildauswahl",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage(
      "Wählen Sie eine Quelle",
    ),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage("Bildquelle"),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Hochladen des Bildes.",
    ),
    "ingredientPhotoUploadFailed": m2,
    "ingredientsOptional": MessageLookupByLibrary.simpleMessage(
      "Zutaten (optional)",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Herkunft der Zutaten",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie eine gültige Zahl ein.",
    ),
    "languageSelection": MessageLookupByLibrary.simpleMessage("Sprachauswahl"),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Geben Sie eine Marke ein",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Modus"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "Noch keine Alternativen.",
    ),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "Noch keine politischen Beiträge.",
    ),
    "nutritionPhotoUploadFailed": m3,
    "nutritionTablePhoto": MessageLookupByLibrary.simpleMessage(
      "Nährwerttabelle",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "originLabel": MessageLookupByLibrary.simpleMessage("Herkunftsland"),
    "originOfIngredients": MessageLookupByLibrary.simpleMessage(
      "Herkunft der Zutaten",
    ),
    "other": MessageLookupByLibrary.simpleMessage("Andere"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Name des Eigentümerunternehmens",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage(
      "Muttergesellschaft",
    ),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Muttergesellschaft (Optional)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Z.B.: Frankreich, USA, China...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Herkunftsland der Muttergesellschaft (Optional)",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("Tiernahrung"),
    "photo": MessageLookupByLibrary.simpleMessage("Foto"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Politische Beiträge 2024",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Präferenzen"),
    "preferencesScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Präferenzen",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Wir können Fehler machen. Wenn Sie einen entdecken, senden Sie uns bitte den Markennamen per E-Mail, damit wir unsere Liste aktualisieren können.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Ein Problem mit einem Produkt?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Produkt und Bild erfolgreich hinzugefügt!",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Produktname"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Geben Sie den Produktnamen ein",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produkt nicht gefunden",
    ),
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Alternative vorschlagen",
    ),
    "reportProblem": MessageLookupByLibrary.simpleMessage("Problem melden"),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Klicken Sie hier, um ein Problem zu melden",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Problem melden",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Ihre Kommentare",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Beschreiben Sie das Problem mit dem Produkt oder der Anwendung.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Geben Sie Ihre E-Mail-Adresse ein, wenn Sie eine Rückmeldung wünschen",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie eine gültige E-Mail-Adresse ein.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Ihre E-Mail (Optional)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Fehler beim Senden des Berichts. Bitte versuchen Sie es erneut.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Helfen Sie uns, die Anwendung zu verbessern",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Beschreiben Sie das Problem oder den Fehler...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Bericht senden",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Vielen Dank! Ihr Bericht wurde zur Überprüfung eingereicht und wird innerhalb von 48 Stunden bearbeitet.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Problem melden",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Bitte beschreiben Sie das Problem.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Bitte geben Sie mehr Details an (mind. 10 Zeichen).",
    ),
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Betrag (Republikaner)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Republikanische Beiträge",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Republikaner"),
    "reset": MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
    "resetCounter": MessageLookupByLibrary.simpleMessage("Zähler zurücksetzen"),
    "safe": MessageLookupByLibrary.simpleMessage("NICHT USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dieses Produkt scheint nicht von einem amerikanischen Unternehmen zu stammen.",
    ),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Beiträge speichern",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Beiträge werden gespeichert...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Scannen Sie einen Barcode",
    ),
    "scoresResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Punkte erfolgreich zurückgesetzt",
    ),
    "searchCountryPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Nach einem Land suchen",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Stellen Sie sicher, dass Sie eine korrekt geschriebene Lebensmittelmarke eingeben, um Fehler zu vermeiden.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Wählen Sie eine Kategorie",
    ),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Bitte wählen Sie eine Kategorie.",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "Land/Länder auswählen…",
    ),
    "selectIngredientPhotoError": MessageLookupByLibrary.simpleMessage(
      "Bitte wählen Sie ein Foto für die Zutaten aus.",
    ),
    "selectNutritionPhotoError": MessageLookupByLibrary.simpleMessage(
      "Bitte wählen Sie ein Foto für die Nährwerttabelle aus.",
    ),
    "selectOriginCountries": MessageLookupByLibrary.simpleMessage(
      "Herkunftsländer auswählen",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Bitte wählen Sie ein Foto.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage(
      "Bild wird gesendet...",
    ),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Informationen werden gesendet...",
    ),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "showTrumpHead": MessageLookupByLibrary.simpleMessage(
      "Trumps Kopf anzeigen",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Quelle nicht gefunden",
    ),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Fehler bei der Übermittlung.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Produkt erfolgreich hinzugefügt!",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Erfolg"),
    "supportCommunity": MessageLookupByLibrary.simpleMessage(
      "Support & Community",
    ),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Textinformationen wurden gesendet, aber das Hochladen des Bildes ist fehlgeschlagen.",
    ),
    "textSubmissionFailed": m4,
    "unableToOpenInstagram": MessageLookupByLibrary.simpleMessage(
      "Instagram konnte nicht geöffnet werden",
    ),
    "unableToOpenLink": MessageLookupByLibrary.simpleMessage(
      "Link konnte nicht geöffnet werden",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("UNBEKANNT"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Das gesuchte Produkt wurde nicht in unserer Datenbank gefunden.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Dieses Produkt stammt von einem amerikanischen Unternehmen!",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Validieren"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Kriterien anzeigen"),
    "visitWebsite": MessageLookupByLibrary.simpleMessage(
      "Unsere Website besuchen",
    ),
    "welcome": MessageLookupByLibrary.simpleMessage("Willkommen bei"),
  };
}
