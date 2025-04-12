import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:detrumpezvous/generated/l10n.dart';

class AddProduct extends StatefulWidget {
  final String barcode;

  const AddProduct({super.key, required this.barcode});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // Création des controllers pour les champs de texte
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  String? category;

  final List<String> categories = [
    S.current
        .alimentation, // Assurez-vous que ces clés existent dans vos ARB si vous souhaitez les utiliser
    S.current.cosmetique,
    S.current.alimentationAnimaux,
    S.current.autre,
  ];

  @override
  void dispose() {
    _productNameController.dispose();
    _brandNameController.dispose();
    super.dispose();
  }

  Future<void> _submitProduct() async {
    // Récupérer les valeurs des controllers
    final productName = _productNameController.text;
    final brandName = _brandNameController.text;

    if (productName.isNotEmpty && brandName.isNotEmpty && category != null) {
      final Map<String, String> categoryUrls = {
        S.current.alimentation:
            "https://world.openfoodfacts.org/cgi/product_jqm2.pl",
        S.current.cosmetique:
            "https://world.openbeautyfacts.org/cgi/product_jqm2.pl",
        S.current.alimentationAnimaux:
            "https://world.openpetfoodfacts.org/cgi/product_jqm2.pl",
        S.current.autre:
            "https://world.openproductsfacts.org/cgi/product_jqm2.pl",
      };

      final String urlString = categoryUrls[category] ??
          "https://world.openproductsfacts.org/cgi/product_jqm2.pl";
      final url = Uri.parse(urlString);

      final data = {
        "code": widget.barcode, // Remplacez par le code-barres saisi ou scanné
        "product_name": productName,
        "brands": brandName,
        "user_id": "detrumpezvous",
        "password": "Mardyn-3sucgy-carvex",
        "json": "1",
      };

      // Affichage de la roue de chargement
      showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CupertinoActivityIndicator(radius: 20),
          );
        },
      );

      final response = await http.post(url, body: data);

      // Fermer la roue de chargement
      Navigator.pop(context);

      if (response.statusCode == 200) {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(S.of(context).successTitle),
              content: Text(S.of(context).successMessage),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(
                        context); // Ferme la boîte de dialogue de succès
                    Navigator.pop(context); // Redirige vers la page précédente
                  },
                  child: Text(S.of(context).validate),
                ),
              ],
            );
          },
        );
      } else {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(S.of(context).errorTitle),
              content: Text(S.of(context).errorMessage),
              actions: [
                CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),
                  child: Text(S.of(context).cancel),
                ),
              ],
            );
          },
        );
      }
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(S.of(context).errorTitle),
            content: Text(S.of(context).fillAllFields),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          CupertinoIcons.chevron_left,
                          color: CupertinoColors.activeBlue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          S.of(context).cancel,
                          style: const TextStyle(
                            color: CupertinoColors.activeBlue,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 24,
              ),
              Text(
                S.of(context).addProductTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).addProductHelp,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue.shade50,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black.withOpacity(0.2), // Couleur de l'ombre
                      offset: const Offset(4, 4), // Décalage de l'ombre (x, y)
                      blurRadius: 10, // Rayon de flou
                      spreadRadius: 1, // Rayon d'expansion
                    ),
                    BoxShadow(
                      color: Colors.white
                          .withOpacity(0.7), // Ombre claire pour effet 3D
                      offset: const Offset(-4, -4), // Décalage inverse
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CupertinoTextField(
                      controller: _productNameController,
                      placeholder: S.of(context).productNamePlaceholder,
                      prefix: Text(
                        S.of(context).productName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      decoration: const BoxDecoration(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Divider(thickness: 1, color: Colors.grey),
                    ),
                    CupertinoTextField(
                      controller: _brandNameController,
                      placeholder: S.of(context).brandNamePlaceholder,
                      prefix: Text(
                        S.of(context).brandName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      decoration: const BoxDecoration(),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Divider(thickness: 1, color: Colors.grey),
                    ),
                    // Sélecteur de catégorie
                    Row(
                      children: [
                        Text(
                          S.of(context).category,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoActionSheet(
                                  title: Text(S.of(context).selectCategory),
                                  actions: categories.map((cat) {
                                    return CupertinoActionSheetAction(
                                      onPressed: () {
                                        setState(() {
                                          category = cat;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(cat),
                                    );
                                  }).toList(),
                                  cancelButton: CupertinoActionSheetAction(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(S.of(context).cancel),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(category ?? S.of(context).selectCategory),
                                const Icon(
                                  CupertinoIcons.chevron_down,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Divider(thickness: 1, color: Colors.grey),
                    ),
                    CupertinoTextField(
                      readOnly: true,
                      placeholder: widget.barcode,
                      prefix: Text(
                        S.of(context).barcode,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CupertinoButton(
                  onPressed: _submitProduct,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(32),
                  child: Text(
                    S.of(context).validate,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
