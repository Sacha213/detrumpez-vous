import 'package:flutter/material.dart';
import 'package:detrumpezvous/generated/l10n.dart'; // Import pour la localisation

class CriteriaScreen extends StatelessWidget {
  const CriteriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).companyCriteriaTitle), // Titre de la page
        backgroundColor: Colors.white, // Ou la couleur de ton thème
        foregroundColor: Colors.black, // Couleur du titre et de l'icône retour
        elevation: 1, // Légère ombre
      ),
      backgroundColor: Colors.white, // Fond de la page
      body: SingleChildScrollView( // Permet le défilement si le contenu est long
        padding: const EdgeInsets.all(20.0), // Padding autour du contenu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligner à gauche
          children: [
            Text(
              S.of(context).companyCriteriaContent,
              style: Theme.of(context).textTheme.bodyLarge, // Style pour le texte principal
            ),
            const SizedBox(height: 24), // Espace plus grand

            // Section "Safe"
            _buildCriteriaSection(
              context: context,
              label: S.of(context).safe,
              explanation: S.of(context).companySafeExplanation,
              color: Colors.green,
            ),
            const SizedBox(height: 24), // Espace entre les sections

            // Section "USA"
            _buildCriteriaSection(
              context: context,
              label: S.of(context).usa,
              explanation: S.of(context).companyUsaExplanation,
              color: Colors.red,
            ),
             const SizedBox(height: 20), // Espace en bas
          ],
        ),
      ),
    );
  }

  // Widget helper pour construire une section de critère
  Widget _buildCriteriaSection({
    required BuildContext context,
    required String label,
    required String explanation,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding interne
      decoration: BoxDecoration(
        color: color.withOpacity(0.05), // Léger fond de couleur
        borderRadius: BorderRadius.circular(12), // Coins arrondis
        border: Border.all(color: color.withOpacity(0.5)), // Bordure légère
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12), // Espace
          Text(
            explanation,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.4, // Interligne pour meilleure lisibilité
            ),
          ),
        ],
      ),
    );
  }
}