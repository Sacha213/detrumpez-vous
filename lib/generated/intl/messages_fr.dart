// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(barcode) =>
      "Fournissez les détails manquants pour le code-barres : ${barcode}";

  static String m1(error) => "Erreur lors de l’envoi : ${error}";

  static String m2(details) =>
      "Échec de l’envoi de la photo des ingrédients : ${details}";

  static String m3(details) =>
      "Échec de l’envoi de la photo nutritionnelle : ${details}";

  static String m4(statusCode) =>
      "Échec de l\'envoi des informations textuelles (status ${statusCode}). Vérifiez les logs pour la réponse HTML.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Cliquez ici pour compléter les infos",
    ),
    "addInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Ajouter des informations",
    ),
    "addIngredientPhoto": MessageLookupByLibrary.simpleMessage(
      "Ajouter une photo des ingrédients",
    ),
    "addPhoto": MessageLookupByLibrary.simpleMessage("Ajouter une photo"),
    "addProductButton": MessageLookupByLibrary.simpleMessage(
      "Ajouter le produit",
    ),
    "addProductHelp": MessageLookupByLibrary.simpleMessage(
      "Aidez-nous en ajoutant un produit à la base de données",
    ),
    "addProductInfoButton": MessageLookupByLibrary.simpleMessage(
      "Ajouter les informations",
    ),
    "addProductInfoError": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de l\'envoi. Veuillez réessayer.",
    ),
    "addProductInfoHeadline": MessageLookupByLibrary.simpleMessage(
      "Compléter les informations du produit",
    ),
    "addProductInfoSubHeadline": m0,
    "addProductInfoSuccess": MessageLookupByLibrary.simpleMessage(
      "Merci ! Vos informations sur le produit ont été soumises pour vérification et seront ajoutées sous 48 heures.",
    ),
    "addProductInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Ajouter des informations",
    ),
    "addProductTitle": MessageLookupByLibrary.simpleMessage(
      "Ajouter un produit",
    ),
    "alternativeSubmitErrorMessage": m1,
    "alternativeSubmittedMessage": MessageLookupByLibrary.simpleMessage(
      "Merci ! Votre alternative a été soumise pour vérification et sera traitée sous 48 heures.",
    ),
    "alternativesLabel": MessageLookupByLibrary.simpleMessage("Alternatives"),
    "appDescription": MessageLookupByLibrary.simpleMessage(
      "Scannez le code-barres de votre produit pour découvrir si la marque est détenue par une entreprise américaine.",
    ),
    "appTitle": MessageLookupByLibrary.simpleMessage("Scannez le code-barres"),
    "barcode": MessageLookupByLibrary.simpleMessage("Code-barres"),
    "barcodeLabel": MessageLookupByLibrary.simpleMessage("Code-barres : "),
    "beauty": MessageLookupByLibrary.simpleMessage("Beauté"),
    "brandHint": MessageLookupByLibrary.simpleMessage(
      "Nom de la marque principale",
    ),
    "brandLabelRequired": MessageLookupByLibrary.simpleMessage("Marque *"),
    "brandName": MessageLookupByLibrary.simpleMessage("Nom de la marque"),
    "brandNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Ex: L\'Oréal",
    ),
    "brandNotFound": MessageLookupByLibrary.simpleMessage("Marque non trouvée"),
    "camera": MessageLookupByLibrary.simpleMessage("Caméra"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "category": MessageLookupByLibrary.simpleMessage("Catégorie"),
    "classificationInfoSubtitle": MessageLookupByLibrary.simpleMessage(
      "Cliquez ici pour découvrir nos critères",
    ),
    "classificationInfoTitle": MessageLookupByLibrary.simpleMessage(
      "Comment les entreprises sont-elles classées ?",
    ),
    "companyCriteriaContent": MessageLookupByLibrary.simpleMessage(
      "Une marque est considérée comme américaine si celle-ci appartient à un groupe américain.",
    ),
    "companyCriteriaTitle": MessageLookupByLibrary.simpleMessage(
      "Critères d\'entreprise américaine",
    ),
    "companyLabel": MessageLookupByLibrary.simpleMessage("Entreprise"),
    "companySafeExplanation": MessageLookupByLibrary.simpleMessage(
      "Ben & jerry est une marque américaine mais a été rachetée par Unilever (multinationale anglo-néerlandaise) en 2000. Ainsi la marque n\'est pas considérée comme américaine.",
    ),
    "companyUsaExplanation": MessageLookupByLibrary.simpleMessage(
      "Vahiné est une marque française mais a été rachetée par le groupe américain McCormick en 2000. Ainsi la marque est considérée comme américaine.",
    ),
    "considerAsAmericanIfLinkedToUSA": MessageLookupByLibrary.simpleMessage(
      "Considérer comme américain si lié aux États-Unis",
    ),
    "contribution": MessageLookupByLibrary.simpleMessage("Contribution"),
    "contributionsInfoText": MessageLookupByLibrary.simpleMessage(
      "Vous pouvez retrouver les montants des contributions pour l\'élection américaine 2024 sur le site web Open Secret.",
    ),
    "contributionsSaveError": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de la sauvegarde des contributions.",
    ),
    "contributionsSavedSuccess": MessageLookupByLibrary.simpleMessage(
      "Contributions sauvegardées avec succès.",
    ),
    "contributorModeInfo": MessageLookupByLibrary.simpleMessage(
      "Plus d’informations sur le mode contributeur",
    ),
    "counter": MessageLookupByLibrary.simpleMessage("Compteur"),
    "counterResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Compteur réinitialisé avec succès",
    ),
    "countrySelectionScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Pays d’origine",
    ),
    "democratContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Montant (Démocrates)",
    ),
    "democratContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Contributions Démocrates",
    ),
    "democratsLabel": MessageLookupByLibrary.simpleMessage("Démocrates"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Description courte du produit",
    ),
    "descriptionLabelRequired": MessageLookupByLibrary.simpleMessage(
      "Description *",
    ),
    "descriptionNotFound": MessageLookupByLibrary.simpleMessage(
      "Cette marque n\'est pas présente dans notre base de données.",
    ),
    "display": MessageLookupByLibrary.simpleMessage("Affichage"),
    "editContributionsButtonLabel": MessageLookupByLibrary.simpleMessage(
      "Modifier",
    ),
    "editContributionsSubtitle": MessageLookupByLibrary.simpleMessage(
      "Modifier les contributions politiques pour l\'élection présidentielle américaine de 2024",
    ),
    "enableBoycottMode": MessageLookupByLibrary.simpleMessage(
      "Activer le mode boycott",
    ),
    "enableContributorMode": MessageLookupByLibrary.simpleMessage(
      "Activer le mode contributeur",
    ),
    "errorMessage": MessageLookupByLibrary.simpleMessage(
      "Une erreur s\'est produite lors de l\'ajout du produit.",
    ),
    "errorTitle": MessageLookupByLibrary.simpleMessage("Erreur"),
    "fieldRequiredError": MessageLookupByLibrary.simpleMessage(
      "Ce champ est requis.",
    ),
    "fillAllFields": MessageLookupByLibrary.simpleMessage(
      "Veuillez remplir tous les champs.",
    ),
    "followUsOnInstagram": MessageLookupByLibrary.simpleMessage(
      "Suivez-nous sur Instagram",
    ),
    "food": MessageLookupByLibrary.simpleMessage("Alimentation"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galerie"),
    "general": MessageLookupByLibrary.simpleMessage("Général"),
    "however": MessageLookupByLibrary.simpleMessage("Cependant"),
    "imagePickError": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de la sélection de l\'image",
    ),
    "imageSourceMessage": MessageLookupByLibrary.simpleMessage(
      "Choisissez une source",
    ),
    "imageSourceTitle": MessageLookupByLibrary.simpleMessage(
      "Source de l\'image",
    ),
    "imageUploadError": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de l\'envoi de l\'image.",
    ),
    "ingredientPhotoUploadFailed": m2,
    "ingredientsOptional": MessageLookupByLibrary.simpleMessage(
      "Ingrédients (optionnel)",
    ),
    "ingredientsOriginLabel": MessageLookupByLibrary.simpleMessage(
      "Origine des ingrédients",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer un nombre valide.",
    ),
    "languageSelection": MessageLookupByLibrary.simpleMessage(
      "Choix de la langue",
    ),
    "manualSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez une marque",
    ),
    "mode": MessageLookupByLibrary.simpleMessage("Mode"),
    "noAlternativesYet": MessageLookupByLibrary.simpleMessage(
      "Aucune alternative pour le moment.",
    ),
    "noPoliticalContributionsYet": MessageLookupByLibrary.simpleMessage(
      "Aucune contribution politique pour le moment.",
    ),
    "nutritionPhotoUploadFailed": m3,
    "nutritionTablePhoto": MessageLookupByLibrary.simpleMessage(
      "Tableau nutritionnel",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "okButtonLabel": MessageLookupByLibrary.simpleMessage("OK"),
    "originLabel": MessageLookupByLibrary.simpleMessage("Pays d\'origine"),
    "originOfIngredients": MessageLookupByLibrary.simpleMessage(
      "Origine des ingrédients",
    ),
    "other": MessageLookupByLibrary.simpleMessage("Autre"),
    "parentCompanyHint": MessageLookupByLibrary.simpleMessage(
      "Nom de l\'entreprise propriétaire",
    ),
    "parentCompanyLabel": MessageLookupByLibrary.simpleMessage("Société mère"),
    "parentCompanyLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Société mère (Optionnel)",
    ),
    "parentOriginHint": MessageLookupByLibrary.simpleMessage(
      "Ex: France, USA, Chine...",
    ),
    "parentOriginLabelOptional": MessageLookupByLibrary.simpleMessage(
      "Pays d\'origine de la société mère (Facultatif)",
    ),
    "petFood": MessageLookupByLibrary.simpleMessage("Nourriture pour animaux"),
    "photo": MessageLookupByLibrary.simpleMessage("Photo"),
    "politicalContributionsTitle": MessageLookupByLibrary.simpleMessage(
      "Contributions Politiques 2024",
    ),
    "preferences": MessageLookupByLibrary.simpleMessage("Préférences"),
    "preferencesScreenTitle": MessageLookupByLibrary.simpleMessage(
      "Préférences",
    ),
    "problemReportMessage": MessageLookupByLibrary.simpleMessage(
      "Nous pouvons faire des erreurs. Si vous en repérez une, veuillez nous envoyer le nom de la marque par e-mail afin que nous puissions mettre à jour notre liste.",
    ),
    "problemReportTitle": MessageLookupByLibrary.simpleMessage(
      "Un problème avec un produit ?",
    ),
    "productAndImageAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Produit et image ajoutés avec succès !",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Nom du produit"),
    "productNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrer le nom du produit",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Produit non trouvé",
    ),
    "proposeAlternativeHint": MessageLookupByLibrary.simpleMessage(
      "Proposer une alternative",
    ),
    "reportProblem": MessageLookupByLibrary.simpleMessage(
      "Signaler un problème",
    ),
    "reportProblemActionSubtitle": MessageLookupByLibrary.simpleMessage(
      "Cliquez ici pour signaler un problème",
    ),
    "reportProblemActionTitle": MessageLookupByLibrary.simpleMessage(
      "Signalez un problème",
    ),
    "reportProblemCommentLabel": MessageLookupByLibrary.simpleMessage(
      "Vos commentaires",
    ),
    "reportProblemDescriptionPrompt": MessageLookupByLibrary.simpleMessage(
      "Décrivez le problème rencontré avec le produit ou l\'application.",
    ),
    "reportProblemEmailHint": MessageLookupByLibrary.simpleMessage(
      "Entrez votre e-mail si vous souhaitez un suivi",
    ),
    "reportProblemEmailInvalid": MessageLookupByLibrary.simpleMessage(
      "Veuillez entrer une adresse e-mail valide.",
    ),
    "reportProblemEmailLabel": MessageLookupByLibrary.simpleMessage(
      "Votre e-mail (Optionnel)",
    ),
    "reportProblemErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de l\'envoi. Veuillez réessayer.",
    ),
    "reportProblemHelpUs": MessageLookupByLibrary.simpleMessage(
      "Aidez-nous à améliorer l\'application",
    ),
    "reportProblemHintText": MessageLookupByLibrary.simpleMessage(
      "Décrivez le problème ou l\'erreur...",
    ),
    "reportProblemSendButton": MessageLookupByLibrary.simpleMessage(
      "Envoyer le rapport",
    ),
    "reportProblemSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Merci ! Votre rapport a été soumis pour vérification et sera traité sous 48 heures.",
    ),
    "reportProblemTitle": MessageLookupByLibrary.simpleMessage(
      "Signaler un problème",
    ),
    "reportProblemValidationErrorEmpty": MessageLookupByLibrary.simpleMessage(
      "Veuillez décrire le problème.",
    ),
    "reportProblemValidationErrorLength": MessageLookupByLibrary.simpleMessage(
      "Veuillez fournir plus de détails (10 caractères min).",
    ),
    "republicanContributionsHint": MessageLookupByLibrary.simpleMessage(
      "Montant (Républicains)",
    ),
    "republicanContributionsLabel": MessageLookupByLibrary.simpleMessage(
      "Contributions Républicaines",
    ),
    "republicansLabel": MessageLookupByLibrary.simpleMessage("Républicains"),
    "reset": MessageLookupByLibrary.simpleMessage("Réinitialiser"),
    "resetCounter": MessageLookupByLibrary.simpleMessage(
      "Réinitialiser le compteur",
    ),
    "safe": MessageLookupByLibrary.simpleMessage("NON USA"),
    "safeProductMessage": MessageLookupByLibrary.simpleMessage(
      "Ce produit ne semble pas provenir d\'une entreprise américaine.",
    ),
    "saveContributionsButton": MessageLookupByLibrary.simpleMessage(
      "Sauvegarder les Contributions",
    ),
    "savingContributions": MessageLookupByLibrary.simpleMessage(
      "Sauvegarde des contributions...",
    ),
    "scanBarcodeLabel": MessageLookupByLibrary.simpleMessage(
      "Scannez un code-barres",
    ),
    "scoresResetSuccess": MessageLookupByLibrary.simpleMessage(
      "Scores réinitialisés avec succès",
    ),
    "searchCountryPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Rechercher un pays",
    ),
    "searchWarning": MessageLookupByLibrary.simpleMessage(
      "⚠️ Assurez-vous d\'entrer une marque alimentaire correctement orthographiée pour éviter des erreurs.",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Sélectionnez une catégorie",
    ),
    "selectCategoryError": MessageLookupByLibrary.simpleMessage(
      "Veuillez sélectionner une catégorie.",
    ),
    "selectCountry": MessageLookupByLibrary.simpleMessage(
      "Sélectionnez le(s) pays…",
    ),
    "selectIngredientPhotoError": MessageLookupByLibrary.simpleMessage(
      "Veuillez sélectionner une photo pour les ingrédients.",
    ),
    "selectNutritionPhotoError": MessageLookupByLibrary.simpleMessage(
      "Veuillez sélectionner une photo pour le tableau nutritionnel.",
    ),
    "selectOriginCountries": MessageLookupByLibrary.simpleMessage(
      "Sélectionnez les pays d’origine",
    ),
    "selectPhotoError": MessageLookupByLibrary.simpleMessage(
      "Veuillez sélectionner une photo.",
    ),
    "sendingImage": MessageLookupByLibrary.simpleMessage(
      "Envoi de l\'image...",
    ),
    "sendingInfo": MessageLookupByLibrary.simpleMessage(
      "Envoi des informations...",
    ),
    "settingsTitle": MessageLookupByLibrary.simpleMessage("Paramètres"),
    "showTrumpHead": MessageLookupByLibrary.simpleMessage(
      "Afficher la tête de Trump",
    ),
    "sourceNotFound": MessageLookupByLibrary.simpleMessage(
      "Source non trouvée",
    ),
    "submissionError": MessageLookupByLibrary.simpleMessage(
      "Erreur lors de la soumission.",
    ),
    "successMessage": MessageLookupByLibrary.simpleMessage(
      "Produit ajouté avec succès !",
    ),
    "successTitle": MessageLookupByLibrary.simpleMessage("Succès"),
    "supportCommunity": MessageLookupByLibrary.simpleMessage(
      "Support & Communauté",
    ),
    "textDataSentButImageFailed": MessageLookupByLibrary.simpleMessage(
      "Les informations textuelles ont été envoyées, mais l\'envoi de l\'image a échoué.",
    ),
    "textSubmissionFailed": m4,
    "unableToOpenInstagram": MessageLookupByLibrary.simpleMessage(
      "Impossible d’ouvrir Instagram",
    ),
    "unableToOpenLink": MessageLookupByLibrary.simpleMessage(
      "Impossible d’ouvrir le lien",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("INCONNU"),
    "unknownProductMessage": MessageLookupByLibrary.simpleMessage(
      "Le produit que vous avez recherché n\'a pas été trouvé dans notre base de données.",
    ),
    "usa": MessageLookupByLibrary.simpleMessage("USA"),
    "usaProductMessage": MessageLookupByLibrary.simpleMessage(
      "Ce produit provient d\'une entreprise américaine !",
    ),
    "validate": MessageLookupByLibrary.simpleMessage("Valider"),
    "viewCriteria": MessageLookupByLibrary.simpleMessage("Voir les critères"),
    "visitWebsite": MessageLookupByLibrary.simpleMessage("Visiter notre site"),
    "welcome": MessageLookupByLibrary.simpleMessage("Bienvenue dans"),
  };
}
