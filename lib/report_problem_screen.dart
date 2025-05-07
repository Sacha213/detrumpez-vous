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
  final TextEditingController emailController =
      TextEditingController(); // Nouveau contrôleur pour l'email
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSending = false;

  @override
  void dispose() {
    commentController.dispose();
    emailController
        .dispose(); // N'oubliez pas de disposer le nouveau contrôleur
    super.dispose();
  }

  Future<void> _sendReport() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isSending = true;
      });

      final String comments = commentController.text.trim();
      final String email = emailController.text.trim(); // Récupérer l'email

      try {
        // Cache le clavier
        FocusScope.of(context).unfocus();

        Map<String, dynamic> reportData = {
          'comments': comments,
          'timestamp': FieldValue.serverTimestamp(),
          'barcode': widget.barcode,
          'reported_brand': widget.brand,
        };

        if (email.isNotEmpty) {
          reportData['user_email'] = email; // Ajouter l'email s'il est fourni
        }

        await FirebaseFirestore.instance.collection('comments').add(reportData);

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
    final s = S.of(context); // Pour un accès plus facile
    return Scaffold(
      appBar: AppBar(
        title: Text(s.reportProblemTitle), // Utiliser S.current ici
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
                  s.reportProblemHelpUs, // Utiliser S.current ici
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  s.reportProblemDescriptionPrompt, // Utiliser S.current ici
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                const SizedBox(height: 24), // Espace augmenté
                // Champ Email (Optionnel)
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: s
                        .reportProblemEmailLabel, // Nouvelle clé de localisation
                    hintText: s
                        .reportProblemEmailHint, // Nouvelle clé de localisation
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
                    if (value == null || value.isEmpty) {
                      return null; // Champ optionnel, donc valide si vide
                    }
                    // Validation simple du format de l'email
                    final emailRegex = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (!emailRegex.hasMatch(value)) {
                      return s
                          .reportProblemEmailInvalid; // Nouvelle clé de localisation
                    }
                    return null;
                  },
                ),
                const SizedBox(
                    height: 16), // Espace avant le champ de commentaire

                // Champ Commentaire
                TextFormField(
                  controller: commentController,
                  maxLines: 6,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: s.reportProblemHintText,
                    labelText: s
                        .reportProblemCommentLabel, // Nouvelle clé de localisation
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
                      return s
                          .reportProblemValidationErrorEmpty; // Utiliser S.current ici
                    }
                    if (value.trim().length < 10) {
                      // Validation de longueur minimale
                      return s
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
                            s.reportProblemSendButton,
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
