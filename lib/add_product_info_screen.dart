import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart'; // Assure-toi d'importer Logger
import 'package:detrumpezvous/generated/l10n.dart'; // Importer S

// Récupère l'instance du logger
final Logger logger = Logger();

class AddProductInfoScreen extends StatefulWidget {
  final String barcode;
  final String initialBrand;
  final String initialDescription;
  final String initialParentCompany;
  final String initialparentOrigin;

  const AddProductInfoScreen({
    super.key,
    required this.barcode,
    this.initialBrand = '',
    this.initialDescription = '',
    this.initialParentCompany = '',
    this.initialparentOrigin = '',
  });

  @override
  State<AddProductInfoScreen> createState() => _AddProductInfoScreenState();
}

class _AddProductInfoScreenState extends State<AddProductInfoScreen> {
  // Contrôleurs pour chaque champ
  final TextEditingController brandController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController parentCompanyController = TextEditingController();
  final TextEditingController parentOriginController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSending = false;

  @override
  void initState() {
    super.initState();
    brandController.text = widget.initialBrand;
    descriptionController.text = widget.initialDescription;
    parentCompanyController.text = widget.initialParentCompany;
    parentOriginController.text = widget.initialparentOrigin;
  }

  @override
  void dispose() {
    // Dispose tous les contrôleurs
    brandController.dispose();
    descriptionController.dispose();
    parentCompanyController.dispose();
    parentOriginController.dispose();
    super.dispose();
  }

  Future<void> _submitProductInfo() async {
    // Utiliser le contexte local pour S
    final s = S.of(context);
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isSending = true;
      });

      final String brand = brandController.text.trim();
      final String description = descriptionController.text.trim();
      final String parentCompany = parentCompanyController.text.trim();
      final String parentOrigin = parentOriginController.text.trim();

      try {
        // Cache le clavier
        FocusScope.of(context).unfocus();

        // Utilise une collection différente, par exemple 'user_added_products'
        await FirebaseFirestore.instance.collection('user_added_products').add({
          'barcode': widget.barcode,
          'brand': brand,
          'description': description,
          'parent_company': parentCompany, // Nom de champ cohérent
          'parent_origin': parentOrigin, // Nom de champ cohérent
          'timestamp': FieldValue.serverTimestamp(),
          // Tu pourrais ajouter l'ID utilisateur si tu as l'authentification
          // 'userId': FirebaseAuth.instance.currentUser?.uid,
        });

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(s.addProductInfoSuccess), // Utiliser S
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context); // Ferme la page
      } catch (e) {
        logger.e("Erreur lors de l'ajout des informations produit", error: e);

        if (!mounted) return;

        setState(() {
          isSending = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(s.addProductInfoError), // Utiliser S
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  // Helper pour créer les TextFormField pour éviter la répétition
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isOptional = false, // Pour rendre certains champs optionnels
    int maxLines = 1,
  }) {
    // Utiliser le contexte local pour S (pour le message d'erreur)
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0), // Espace entre les champs
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType:
            maxLines > 1 ? TextInputType.multiline : TextInputType.text,
        textInputAction:
            maxLines > 1 ? TextInputAction.newline : TextInputAction.next,
        decoration: InputDecoration(
          labelText: label, // Le label est passé déjà traduit
          hintText: hint, // Le hint est passé déjà traduit
          prefixIcon: Icon(icon, size: 20), // Icône indicative
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        validator: (value) {
          if (!isOptional && (value == null || value.trim().isEmpty)) {
            return s.fieldRequiredError; // Utiliser S pour le message d'erreur
          }
          return null; // Pas d'erreur
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Utiliser le contexte local pour S
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.addProductInfoTitle), // Utiliser S
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  s.addProductInfoHeadline, // Utiliser S
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  s.addProductInfoSubHeadline(
                      widget.barcode), // Utiliser S avec placeholder
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                const SizedBox(height: 24),

                // Utilisation du helper pour les champs avec les clés de traduction
                _buildTextField(
                  controller: brandController,
                  label: s.brandLabelRequired, // Utiliser S
                  hint: s.brandHint, // Utiliser S
                  icon: Icons.label_outline,
                ),
                _buildTextField(
                  controller: descriptionController,
                  label: s.descriptionLabelRequired, // Utiliser S
                  hint: s.descriptionHint, // Utiliser S
                  icon: Icons.description_outlined,
                  maxLines: 3, // Permet plus de texte pour la description
                ),
                _buildTextField(
                  controller: parentCompanyController,
                  label: s.parentCompanyLabelOptional, // Utiliser S
                  hint: s.parentCompanyHint, // Utiliser S
                  icon: Icons.business_center_outlined,
                  isOptional: true, // Ce champ est optionnel
                ),
                _buildTextField(
                  controller: parentOriginController,
                  label: s.parentOriginLabelOptional, // Utiliser S
                  hint: s.parentOriginHint, // Utiliser S
                  icon: Icons.flag_outlined,
                  isOptional: true, // Ce champ est optionnel
                ),

                const SizedBox(height: 16), // Espace avant le bouton
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    // Utiliser la couleur primaire pour l'ajout
                    color: Colors.blue,
                    disabledColor: Colors.grey.shade400,
                    onPressed: isSending ? null : _submitProductInfo,
                    child: isSending
                        ? const CupertinoActivityIndicator(color: Colors.white)
                        : Text(
                            s.addProductInfoButton, // Utiliser S
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
