import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:detrumpezvous/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditContributionsScreen extends StatefulWidget {
  final int? initialDemocratContribution;
  final int? initialRepublicanContribution;
  final String companyName;
  final String normalizedName;

  const EditContributionsScreen({
    super.key,
    this.initialDemocratContribution,
    this.initialRepublicanContribution,
    required this.companyName,
    required this.normalizedName,
  });

  @override
  State<EditContributionsScreen> createState() =>
      _EditContributionsScreenState();
}

class _EditContributionsScreenState extends State<EditContributionsScreen> {
  final TextEditingController _democratContributionController =
      TextEditingController();
  final TextEditingController _republicanContributionController =
      TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialDemocratContribution != null) {
      _democratContributionController.text =
          widget.initialDemocratContribution.toString();
    }
    if (widget.initialRepublicanContribution != null) {
      _republicanContributionController.text =
          widget.initialRepublicanContribution.toString();
    }
  }

  @override
  void dispose() {
    _democratContributionController.dispose();
    _republicanContributionController.dispose();
    super.dispose();
  }

  Future<void> _incrementContributionScore(int points) async {
    final prefs = await SharedPreferences.getInstance();
    int contributionScore = prefs.getInt('contributionScore') ?? 0;
    contributionScore += points; // Ajoute les points au score actuel

    await prefs.setInt(
        'contributionScore', contributionScore); // Sauvegarde le score
  }

  Future<void> _submitContributions() async {
    final s = S.of(context);
    final democratText = _democratContributionController.text
        .replaceAll(RegExp(r'[^0-9]'), '')
        .trim();
    final republicanText = _republicanContributionController.text
        .replaceAll(RegExp(r'[^0-9]'), '')
        .trim();

    int? democratContribution = int.tryParse(democratText);
    int? republicanContribution = int.tryParse(republicanText);

    if (democratText.isNotEmpty && democratContribution == null) {
      _showErrorDialog(s.invalidNumberError);
      return;
    }
    if (republicanText.isNotEmpty && republicanContribution == null) {
      _showErrorDialog(s.invalidNumberError);
      return;
    }

    democratContribution ??= 0;
    republicanContribution ??= 0;

    setState(() => _isSubmitting = true);
    _showLoadingDialog(s.savingContributions);

    try {
      await FirebaseFirestore.instance.collection('company_contributions').add({
        'companyName': widget.companyName,
        'normalizedName': widget.normalizedName,
        'democratContribution': democratContribution,
        'republicanContribution': republicanContribution,
        'timestamp': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        Navigator.pop(context); // Ferme le dialogue de chargement
        _showSuccessDialogAndPop(s.contributionsSavedSuccess);

        _incrementContributionScore(10); // Incrémente le score de contribution
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
        _showErrorDialog(s.contributionsSaveError);
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showLoadingDialog(String message) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => CupertinoAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CupertinoActivityIndicator(radius: 15),
            const SizedBox(height: 16),
            Text(message, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    final s = S.of(context);
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(s.errorTitle),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(s.okButtonLabel), // Assurez-vous d'avoir "OK" localisé
          ),
        ],
      ),
    );
  }

  void _showSuccessDialogAndPop(String message) {
    final s = S.of(context);
    showCupertinoDialog(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(s.successTitle),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(dialogContext); // Ferme le dialogue
              Navigator.pop(context,
                  true); // Ferme l'écran EditContributionsScreen et retourne true
            },
            child: Text(s.validate), // "Valider" ou "OK"
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // Changé en Scaffold
      appBar: AppBar(
        // Utilisation de AppBar
        title: Text(widget.companyName),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.editContributionsSubtitle,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navLargeTitleTextStyle
                    .copyWith(
                        fontSize:
                            28), // Style plus grand pour le titre dans le corps
              ),
              const SizedBox(height: 8),
              Text(
                s.contributionsInfoText,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .tabLabelTextStyle
                    .copyWith(fontSize: 16), // Augmentez la taille de la police
              ),
              const SizedBox(height: 24),
              Text(
                "${s.democratContributionsLabel} (\$)",
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navTitleTextStyle
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _democratContributionController,
                placeholder: s.democratContributionsHint,
                keyboardType: TextInputType.number,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "${s.republicanContributionsLabel} (\$)",
                style: CupertinoTheme.of(context)
                    .textTheme
                    .navTitleTextStyle
                    .copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _republicanContributionController,
                placeholder: s.republicanContributionsHint,
                keyboardType: TextInputType.number,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: _isSubmitting ? null : _submitContributions,
                  child: _isSubmitting
                      ? const CupertinoActivityIndicator(color: Colors.white)
                      : Text(
                          s.saveContributionsButton,
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
