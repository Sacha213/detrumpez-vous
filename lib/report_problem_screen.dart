import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart'; // Assure-toi d'importer Logger si tu l'utilises
import 'package:detrumpezvous/generated/l10n.dart'; // Importer S

// Récupère l'instance du logger (si tu l'utilises ailleurs)
final Logger logger = Logger();

class ReportProblemScreen extends StatefulWidget {
  final String barcode;
  final String brand;

  const ReportProblemScreen({
    super.key,
    required this.barcode,
    required this.brand,
  });

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  final TextEditingController commentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSending = false;

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  Future<void> _sendReport() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isSending = true;
      });

      final String comments = commentController.text.trim();

      try {
        // Cache le clavier
        FocusScope.of(context).unfocus();

        await FirebaseFirestore.instance.collection('comments').add({
          'comments': comments,
          'timestamp': FieldValue.serverTimestamp(),
          'barcode': widget.barcode, // Utilise widget.barcode
          'reported_brand': widget.brand, // Utilise widget.brand
        });

        // Vérifie si le widget est toujours monté avant d'afficher la SnackBar ou de pop
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // Utiliser S.current ici
            content: Text(S.of(context).reportProblemSuccessMessage),
            backgroundColor: Colors.green,
          ),
        );

        // Ferme la page après succès
        Navigator.pop(context);
      } catch (e) {
        logger.e("Erreur lors de l'envoi du commentaire", error: e);

        // Vérifie si le widget est toujours monté avant de mettre à jour l'état
        if (!mounted) return;

        setState(() {
          isSending = false; // Réactive le bouton en cas d'erreur
        });

        // Optionnel : Afficher une SnackBar d'erreur
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // Utiliser S.current ici
            content: Text(S.of(context).reportProblemErrorMessage),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).reportProblemTitle), // Utiliser S.current ici
        backgroundColor: Colors.white, // Ou la couleur de ton thème
        foregroundColor: Colors.black, // Couleur du titre et de l'icône retour
        elevation: 1, // Légère ombre
      ),
      backgroundColor: Colors.white, // Fond de la page
      body: SingleChildScrollView(
        // Pour éviter les overflows avec le clavier
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).reportProblemHelpUs, // Utiliser S.current ici
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  S
                      .of(context)
                      .reportProblemDescriptionPrompt, // Utiliser S.current ici
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                const SizedBox(height: 24), // Espace augmenté
                TextFormField(
                  controller: commentController,
                  maxLines: 6, // Un peu plus de lignes
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: S
                        .of(context)
                        .reportProblemHintText, // Utiliser S.current ici
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S
                          .of(context)
                          .reportProblemValidationErrorEmpty; // Utiliser S.current ici
                    }
                    if (value.trim().length < 10) {
                      // Validation de longueur minimale
                      return S
                          .of(context)
                          .reportProblemValidationErrorLength; // Utiliser S.current ici
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: Colors.redAccent,
                    disabledColor: Colors.grey.shade400,
                    onPressed: isSending
                        ? null
                        : _sendReport, // Appelle la fonction d'envoi
                    child: isSending
                        ? const CupertinoActivityIndicator(color: Colors.white)
                        : Text(
                            // Utiliser S.current ici
                            S.of(context).reportProblemSendButton,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                const SizedBox(height: 20), // Espace en bas
              ],
            ),
          ),
        ),
      ),
    );
  }
}
