# DeTrumpez-vous

**DeTrumpez-vous** est une application flutter qui vous permet de scanner les codes-barres de vos produits alimentaires pour vérifier si les capitaux investis dans l'entreprise proviennent d'une société américaine. Dans le contexte actuel de guerre commerciale imposée par l'administration Trump, cette application vous aide à faire des choix de consommation éclairés et à agir à votre échelle.

L'application est disponible sur l'apple store et le play store !

---

## Contenu du dépôt

- **Fichier JSON des marques**  
  Le fichier `blacklist.json` contient la liste avec les principales marques U.S. de l'agroalimentaire, avec pour chacune un nom, une description précisant son lien avec les États-Unis et une source d'information.

- **Code source de l'application**  
  Le code complet de l'application se trouve dans le répertoire `lib/`.



---

## Fonctionnement

1. **Scan du code-barres**  
   L'utilisateur scanne le code-barres du produit, ce qui permet de récupérer le numéro unique du produit.

2. **Requêtes aux API externes**  
   L'application envoie des requêtes aux API telles que Open Food Facts, Open Beauty Facts, Open Pet Food Facts et Open Product Fact. Ces API renvoient des informations (notamment le nom et la marque du produit).

3. **Recherche dans la blacklist**  
   Le nom de la marque récupéré est ensuite comparé avec la liste présente dans le fichier JSON (la blacklist). La comparaison s'appuie sur le champ `normalizedName` pour uniformiser le traitement (minuscule, sans accents et avec des underscores).  
   - Si la marque correspond à une entrée de la blacklist, l'application indique que le produit provient d'une entreprise américaine.
   - Si aucune correspondance n'est trouvée, l'utilisateur peut saisir manuellement la marque via un popup Cupertino.

---

## Installation et lancement

1. **Cloner le dépôt :**
   ````bash
   git clone https://github.com/Sacha213/detrumpez-vous.git
   ````

2. **Installer les dépendances :**
    ````bash
    flutter pub get
    ````

3. **Lancer l’application :**
    ````bash
    flutter run
    ````


---

## Contribution

Les améliorations, corrections de bugs et nouvelles fonctionnalités sont les bienvenues !  
Si vous souhaitez contribuer, veuillez :
- Ouvrir une *issue* pour discuter de vos idées.
- Soumettre une *pull request* avec vos modifications.

Chaque contribution est précieuse pour améliorer le projet et aider chacun à faire des choix de consommation éclairés.

---

## Licence

Ce projet est sous licence [GNU General Public License v3.0](LICENSE).

---

## Contact

Pour toute question ou suggestion, merci de créer une *issue* sur GitHub ou de nous contacter par email à [contact@detrumpez-vous.com](mailto:contact@detrumpez-vous.com).

---

Detrumpez-vous – Informez-vous, agissez, et reprenez le contrôle de vos achats !
