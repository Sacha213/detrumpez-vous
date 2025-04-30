import 'dart:convert'; // Import nécessaire pour json.decode
import 'dart:io'; // Import pour lire les fichiers
import 'package:diacritic/diacritic.dart';

Set<String> tocheck = {
  "My Vay",
  "Christian LENART",
  "Golden Bridge",
  "Pollen de fleurs Gabriel Perroneau",
  "Canaillou (nom français)",
  "Soy",
  "B&S",
  "WOOLITE",
  "SIMPLEMENT BON ET BIO",
  "La Ferme Normande",
  "gilettes",
  "Dakatine",
  "Lea & Perrins",
  "miel de fleurs",
  "Phare d'Eckmül",
  "Le Marsigny",
  "Sea salt grinder",
  "timing Earl grey",
  "Cosmia",
  "Hélène",
  "Pommery.",
  "Milka",
  "petit test",
  "Milsani",
  "Les 3 Meuniers",
  "BOEHLI",
  "Ben’s Original",
  "bio village",
  "Brets",
  "Favrichon & Vignon",
  "jules destrooper",
  "Tanoshi",
  "Pastouret",
  "sensodyne",
  "Les Assaisonnements Briard. Moutarde de Meaux.",
  "Terre d’Oc",
  "La Phocéenne de Cosmétique",
  "kallo",
  "LE PAIN DES FLEURS",
  "ProActiv",
  "Jardin Bio",
  "Grand Fermage",
  "samyang",
  "Antésite",
  "Duyvis",
  "body nature",
  "Pays Gourmand",
  "La Bergerie",
  "Demak Up Cocoon"
};

// Déclarez brandlist ici pour qu'elle soit accessible globalement
late List<dynamic>
    brandlist; // Assurez-vous que le type correspond à votre JSON

Future<void> main() async {
  //Etape n°1
  // Lire le fichier JSON depuis le système de fichiers
  final String jsonStr = await File('assets/brandlist.json').readAsString();
  brandlist = json.decode(jsonStr); // Initialisez brandlist

  //etape1();
  etape2();
}

void etape1() async {
  print("No match found for brand:");
  for (final brand in tocheck) {
    // Utilisez final pour la variable de boucle
    Map<String, dynamic> brandInfo = await getBrandInfo(brand);
    if (brandInfo.isEmpty) {
      print("$brand");
    }
  }
}

void etape2() async {
  //Etape n°2
  List<Map<String, dynamic>> toImprove = [
    {
      "name": "My Vay",
      "description": "Panés tomates mozzarella",
      "parentCompany": "Cité Marine",
      "parentOrigin": "FR",
      "normalizedName": "my_vay",
      "source": "User added information"
    },
    {
      "name": "Canaillou",
      "description": "Canaillou est une marque est une marque de croquettes.",
      "parentCompany": "Les Mousquetaires",
      "parentOrigin": "FR",
      "normalizedName": "canaillou",
      "source": "Site officiel d'Intermarché"
    },
    {
      "name": "B&S",
      "description":
          "B&S est une gamme complète de fruits secs et de graines grillées salées conditionnée dans des barquettes hermétiques.",
      "parentCompany": "AGIDRA",
      "parentOrigin": "FR",
      "normalizedName": "b_s",
      "source": "Site officiel AGIDRA"
    },
    {
      "name": "Gillette",
      "description":
          "Marque américaine de rasoirs et produits de soins pour hommes.",
      "parentCompany": "Procter & Gamble",
      "parentOrigin": "US",
      "normalizedName": "gillette",
      "source": "Wikipedia: Gillette"
    },
    {
      "name": "Dakatine",
      "description": "Marque française de pâte de cacahuète.",
      "parentCompany": "Diester",
      "parentOrigin": "FR",
      "normalizedName": "dakatine",
      "source": "Wikipedia: Dakatine"
    },
    {
      "name": "Miel de fleurs",
      "description": "Marque de miel de fleurs.",
      "parentCompany": "Vacher & Co",
      "parentOrigin": "FR",
      "normalizedName": "miel_de_fleurs",
      "source": "Site officiel Vacher & Co"
    },
    {
      "name": "Phare d'Eckmül",
      "description": "Marque française de conserves de poisson.",
      "parentCompany": "Phare d'Eckmül",
      "parentOrigin": "FR",
      "normalizedName": "phare_d_eckmul",
      "source": "Wikipedia: Phare d'Eckmül"
    },
    {
      "name": "Le Marsigny",
      "description": "Marque de charcuterie d'Aldi.",
      "parentCompany": "Aldi",
      "parentOrigin": "FR",
      "normalizedName": "le_marsigny",
      "source": "Site officiel d'Aldi"
    },
    {
      "name": "Sea salt grinder",
      "description": "Marque d’outil pour moudre le sel marin.",
      "parentCompany": "MC Cormick",
      "parentOrigin": "FR",
      "normalizedName": "sea_salt_grinder",
      "source": "User added information"
    },
    {
      "name": "Hélène Grèce Authentique",
      "description":
          "Hélène Grèce Authentique est une marque française spécialisée dans l'importation et la distribution de produits grecs authentiques : huiles d'olive, olives, miels, fromages et spécialités artisanales. Elle valorise le savoir-faire traditionnel grec à travers une sélection rigoureuse de producteurs locaux.",
      "parentCompany": "Délices Grecs",
      "parentOrigin": "FR",
      "normalizedName": "helene_grece_authentique",
      "source": "Site officiel Délices Grecs"
    },
    {
      "name": "Milsani",
      "description": "Marque distributeur de produits laitiers (Lidl).",
      "parentCompany": "Lidl",
      "parentOrigin": "DE",
      "normalizedName": "milsani",
      "source": "Site officiel Lidl"
    },
    {
      "name": "Les 3 Meuniers",
      "description": "Marque française de farine.",
      "parentCompany": "Les Mousquetaires",
      "parentOrigin": "FR",
      "normalizedName": "les_3_meuniers",
      "source": "Intermarché"
    },
    {
      "name": "Les Assaisonnements Briard – Moutarde de Meaux",
      "description": "Moutarde de Meaux, condiments traditionnels.",
      "parentCompany": "Les Assaisonnements Briard",
      "parentOrigin": "FR",
      "normalizedName": "les_assaisonnements_briard_moutarde_de_meaux",
      "source": "Wikipedia: Moutarde de Meaux"
    },
    {
      "name": "Demak Up Cocoon",
      "description": "Gamme de cotons démaquillants Cocoon.",
      "parentCompany": "Procter & Gamble",
      "parentOrigin": "US",
      "normalizedName": "demak_up_cocoon",
      "source": "Site officiel Demak’Up"
    },
    {
      "name": "Domédia",
      "description": "Marque maison et loisir d'intermarché.",
      "parentCompany": "Les Mousquetaires",
      "parentOrigin": "FR",
      "normalizedName": "domedia",
      "source": "Site officiel d'Intermarché"
    },
    {
      "name": "Yves Rocher",
      "description":
          "Yves Rocher est une entreprise française de cosmétiques fondée par Yves Rocher",
      "parentCompany": "Groupe Rocher",
      "parentOrigin": "FR",
      "normalizedName": "yves_rocher",
      "source": "Wikipedia: Yves Rocher"
    },
    {
      "name": "Naturalia",
      "description":
          "Naturalia France est une enseigne de distribution française spécialisée dans les produits issus de l'agriculture biologique",
      "parentCompany": "Casino Guichard-Perrachon S.A.",
      "parentOrigin": "FR",
      "normalizedName": "naturalia",
      "source": "Wikipedia: Naturalia"
    },
    {
      "name": "Bubble Go",
      "description": "Bubble tea wild strawberry",
      "parentCompany": "Food Partner CO SA",
      "parentOrigin": "BE",
      "normalizedName": "bubble_go",
      "source": "User added information"
    },
    {
      "name": "SPAM",
      "description": "Chopped pork and ham",
      "parentCompany": "Danish Crown Foods",
      "parentOrigin": "DK",
      "normalizedName": "spam",
      "source": "User added information"
    }
  ];

  //On normalise tout les éléments de toImprove
  for (Map<String, dynamic> brand in toImprove) {
    brand["normalizedName"] = normalizeBrandName(brand["name"]);
  }

  //Etape n°3 : On vérifie que le normalizedName n'est pas déjà dans le fichier brandlist.json
  List finalList = [];
  for (final brand in toImprove) {
    // Utilisez final pour la variable de boucle
    Map<String, dynamic> brandInfo = await getBrandInfo(brand["name"]);

    if (brandInfo.isEmpty) {
      finalList.add(brand);
    }
  }

  //On save dans un fichier json
  File('brandsToAdd.json').writeAsStringSync(jsonEncode(finalList));
  print("Fichier brands.json créé avec succès.");
}

String normalizeBrandName(String input) {
  return removeDiacritics(input.toLowerCase().replaceAll(
          RegExp(r'\band\b', caseSensitive: false),
          "")) // Supprimer les accents et "and"
      .replaceAll(RegExp(r"[’‘`´®™]"), "") // Supprimer les caractères spéciaux
      .replaceAll(RegExp(r"[\s\-‑]+"),
          "_") // Remplacer les espaces et tirets par des underscores
      .replaceAll(RegExp(r"[^a-z0-9_]+"),
          "") // Supprimer tout sauf lettres, chiffres et underscores
      .replaceAll(RegExp(r"_+"),
          "_") // Remplacer plusieurs underscores consécutifs par un seul underscore
      .trim(); // Supprimer les espaces en début/fin
}

Future<Map<String, dynamic>> getBrandInfo(String brandName) async {
  // On découpe l'entrée sur les virgules pour obtenir plusieurs candidats
  final List<String> candidates = brandName
      .split(',')
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();

  // Pour chaque candidat, on le normalise et on cherche une correspondance
  for (final candidate in candidates) {
    final String normalizedCandidate = normalizeBrandName(candidate);

    try {
      // Assurez-vous que brandlist est bien une List<Map<String, dynamic>> ou similaire
      final Map<String, dynamic> found = brandlist.firstWhere((brand) {
        // Vérifiez que 'brand' est bien un Map avant d'accéder à ses clés
        if (brand is Map<String, dynamic>) {
          final String normalizedName =
              (brand["normalizedName"] ?? "").toString().toLowerCase();
          // On vérifie si le champ stocké est identique au candidat normalisé
          return normalizedName == normalizedCandidate;
        }
        return false; // Si ce n'est pas un Map, on ne peut pas comparer
      }, orElse: () => <String, dynamic>{} // Littérale typée
          );
      if (found.isNotEmpty) {
        return found;
      }
    } catch (e) {
      // Au cas où on ne trouve rien pour ce candidat, on passe au suivant
      print("Error finding brand '$candidate': $e"); // Optionnel: log l'erreur
      continue;
    }
  }

  // Si aucun des candidats ne correspond, on renvoie un Map vide
  return <String, dynamic>{};
}
