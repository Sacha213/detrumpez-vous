import 'dart:convert'; // Import pour jsonDecode
import 'dart:io';
import 'package:detrumpezvous/country_selection_screen.dart';
import 'package:detrumpezvous/secrets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:detrumpezvous/generated/l10n.dart'; // Assure-toi que c'est importé
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart'; // Import pour StreamGroup et ByteStream
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import pour basename

class AddProduct extends StatefulWidget {
  final String barcode;

  const AddProduct({super.key, required this.barcode});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  //bool _ingredientsFromUS = false;

  String category = S.current.food;
  bool _isSubmitting = false;

  late final Map<String, IconData> categoryIcons;
  late final List<String> categories;

  File? _selectedImageFile;
  File? _selectedIngredientImageFile;
  File? _selectedNutritionImageFile; // ← nouveau

  final ImagePicker _picker = ImagePicker();
  int _contributionScore = 0; // Score de contribution

  Set<String> _selectedOrigins = {};
  late BuildContext _loadingDialogContext;

  @override
  void initState() {
    super.initState();
    categories = [
      S.current.food,
      S.current.beauty,
      S.current.petFood,
      S.current.other,
    ];
    categoryIcons = {
      S.current.food: Icons.restaurant_menu,
      S.current.beauty: Icons.spa,
      S.current.petFood: Icons.pets,
      S.current.other: Icons.category,
    };
    _loadCounters(); // Charge les compteurs, y compris _contributionScore
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _brandNameController.dispose();
    super.dispose();
  }

  Future<void> _loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _contributionScore =
          prefs.getInt('contributionScore') ?? 0; // Charge le score
    });
  }

  Future<void> _incrementContributionScore(int points) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _contributionScore += points; // Ajoute les points au score actuel
    });
    await prefs.setInt(
        'contributionScore', _contributionScore); // Sauvegarde le score
  }

  Future<void> _pickImage(ImageSource source, String type) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1000,
      );

      if (pickedFile == null) return;
      setState(() {
        switch (type) {
          case "product":
            _selectedImageFile = File(pickedFile.path);
            break;
          case "ingredient":
            _selectedIngredientImageFile = File(pickedFile.path);
            break;
          case "nutrition": // ← nouveau
            _selectedNutritionImageFile = File(pickedFile.path);
            break;
        }
      });
    } catch (e) {
      if (mounted) {
        final s = S.of(this.context);
        showCupertinoDialog(
          context: this.context,
          builder: (dialogContext) => CupertinoAlertDialog(
            title: Text(s.errorTitle),
            content: Text(s.imagePickError),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("OK"),
                onPressed: () => Navigator.pop(dialogContext),
              )
            ],
          ),
        );
      }
    }
  }

  void _showImageSourceActionSheet(BuildContext context, String type) {
    final s = S.of(context);
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext sheetContext) => CupertinoActionSheet(
        title: Text(s.imageSourceTitle),
        message: Text(s.imageSourceMessage),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text(s.camera),
            onPressed: () {
              Navigator.pop(sheetContext);
              _pickImage(ImageSource.camera, type);
            },
          ),
          CupertinoActionSheetAction(
            child: Text(s.gallery),
            onPressed: () {
              Navigator.pop(sheetContext);
              _pickImage(ImageSource.gallery, type);
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(sheetContext);
          },
          child: Text(s.cancel),
        ),
      ),
    );
  }

  void _showLoadingDialog(String message) {
    showCupertinoDialog(
      context: this.context,
      barrierDismissible: false,
      builder: (dialogContext) {
        _loadingDialogContext = dialogContext;
        return CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CupertinoActivityIndicator(radius: 15),
              const SizedBox(height: 12),
              Text(message, style: const TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    );
  }

  Future<Map<String, dynamic>> _uploadSingleImage({
    required File imageFile,
    required Uri imageUploadUri,
    required String barcode,
    required String imageField, // ex: 'front_fr', 'ingredients', 'nutrition'
    required String userId,
    required String password,
  }) async {
    final fileFieldName = 'imgupload_$imageField';
    final request = http.MultipartRequest('POST', imageUploadUri)
      ..fields['code'] = barcode
      ..fields['user_id'] = userId
      ..fields['password'] = password
      ..fields['imagefield'] = imageField;

    final stream =
        http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    final length = await imageFile.length();
    final multipartFile = http.MultipartFile(
      fileFieldName,
      stream,
      length,
      filename: basename(imageFile.path),
    );
    request.files.add(multipartFile);

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final statusCode = response.statusCode;

      if (statusCode == 200) {
        final decoded = jsonDecode(responseBody);
        if (decoded is Map && decoded['status'] == 'status ok') {
          return {'success': true, 'message': 'Image uploaded successfully.'};
        } else if (decoded is Map && decoded.containsKey('error')) {
          return {'success': false, 'message': decoded['error']};
        }
        return {
          'success': false,
          'message': 'Unexpected server response: $responseBody'
        };
      } else {
        return {
          'success': false,
          'message': 'Upload failed with status $statusCode: $responseBody'
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error during image upload: ${e.toString()}'
      };
    }
  }

  Future<void> _submitProduct() async {
    final s = S.of(this.context);

    // --- Validations initiales ---
    // Si une validation échoue, on affiche l'erreur et on sort.
    // _isSubmitting n'est pas encore à true, donc pas besoin de le réinitialiser ici.
    final productName = _productNameController.text.trim();
    final brandName = _brandNameController.text.trim();

    if (productName.isEmpty || brandName.isEmpty) {
      _showErrorDialog(s.fillAllFields);
      return;
    }
    /*if (category == null) {
      // Bien que 'category' soit initialisé, une vérification par sécurité.
      _showErrorDialog(s.selectCategoryError);
      return;
    }*/
    if (_selectedImageFile == null) {
      _showErrorDialog(s.selectPhotoError);
      return;
    }
    if (category != s.other && _selectedIngredientImageFile == null) {
      // Assurez-vous que 'selectIngredientPhotoError' est défini dans vos fichiers .arb
      _showErrorDialog(s.selectIngredientPhotoError);
      return;
    }
    if (category == s.food && _selectedNutritionImageFile == null) {
      // Assurez-vous que 'selectNutritionPhotoError' est défini dans vos fichiers .arb
      _showErrorDialog(s.selectNutritionPhotoError);
      return;
    }

    // Protection contre les double-clics juste avant de commencer le processus de soumission.
    if (_isSubmitting) return;

    setState(() => _isSubmitting = true);

    // --- URLs et Identifiants API ---
    // (Votre code existant pour déterminer textUri, imageUri, userId, password)
    final Map<String, String> textApiUrls = {
      s.food: "https://world.openfoodfacts.org/cgi/product_jqm2.pl",
      s.beauty: "https://world.openbeautyfacts.org/cgi/product_jqm2.pl",
      s.petFood: "https://world.openpetfoodfacts.org/cgi/product_jqm2.pl",
      s.other: "https://world.openproductsfacts.org/cgi/product_jqm2.pl",
    };
    final Map<String, String> imageApiUrls = {
      s.food: "https://world.openfoodfacts.org/cgi/product_image_upload.pl",
      s.beauty: "https://world.openbeautyfacts.org/cgi/product_image_upload.pl",
      s.petFood:
          "https://world.openpetfoodfacts.org/cgi/product_image_upload.pl",
      s.other:
          "https://world.openproductsfacts.org/cgi/product_image_upload.pl",
    };

    final String textUrlString = textApiUrls[category] ?? textApiUrls[s.other]!;
    final String imageUrlString =
        imageApiUrls[category] ?? imageApiUrls[s.other]!;
    final textUri = Uri.parse(textUrlString);
    final imageUri = Uri.parse(imageUrlString);

    const String userId = apiUserId; // Défini dans secrets.dart
    const String password = apiPassword; // Défini dans secrets.dart
    final Locale currentLocale = Localizations.localeOf(this.context);
    final String languageCode = currentLocale.languageCode;

    try {
      _showLoadingDialog(s
          .sendingInfo); // Affiche le dialogue et stocke son contexte dans _loadingDialogContext

      // --- Envoi des données textuelles ---
      final textData = {
        "code": widget.barcode,
        "product_name": productName,
        "brands": brandName,
        "user_id": userId,
        "password": password,
        "comment": "Ajout via l'application Détrumpez-vous",
        "lc": languageCode,
        if (_selectedOrigins.isNotEmpty) "origins": _selectedOrigins.join(','),
        // Ajoutez d'autres champs si nécessaire, comme countries_tags
      };

      final textResponse = await http.post(textUri, body: textData);
      if (textResponse.statusCode != 200) {
        print(
            "Text submission failed (${textResponse.statusCode}): ${textResponse.body}");
        throw Exception(s.textSubmissionFailed(textResponse.statusCode));
      }
      await _incrementContributionScore(10);

      // --- Envoi des images ---
      bool frontImageSuccess = false;
      String frontImageErrorMsg = "";
      bool ingredientsImageSuccess = true;
      String ingredientsImageErrorMsg = "";
      bool nutritionImageSuccess = true;
      String nutritionImageErrorMsg = "";

      if (_selectedImageFile != null) {
        final result = await _uploadSingleImage(
          imageFile: _selectedImageFile!,
          imageUploadUri: imageUri,
          barcode: widget.barcode,
          imageField: 'front_$languageCode',
          userId: userId,
          password: password,
        );
        frontImageSuccess = result['success'];
        frontImageErrorMsg = result['message'];
        if (frontImageSuccess) await _incrementContributionScore(20);
      }

      if (category != s.other && _selectedIngredientImageFile != null) {
        final result = await _uploadSingleImage(
          imageFile: _selectedIngredientImageFile!,
          imageUploadUri: imageUri,
          barcode: widget.barcode,
          imageField: 'ingredients_$languageCode',
          userId: userId,
          password: password,
        );
        ingredientsImageSuccess = result['success'];
        ingredientsImageErrorMsg = result['message'];
        if (ingredientsImageSuccess) {
          await _incrementContributionScore(15);
        } else {
          print("Ingredients image upload failed: $ingredientsImageErrorMsg");
        }
      }

      if (category == s.food && _selectedNutritionImageFile != null) {
        final result = await _uploadSingleImage(
          imageFile: _selectedNutritionImageFile!,
          imageUploadUri: imageUri,
          barcode: widget.barcode,
          imageField: 'nutrition_$languageCode',
          userId: userId,
          password: password,
        );
        nutritionImageSuccess = result['success'];
        nutritionImageErrorMsg = result['message'];
        if (nutritionImageSuccess) {
          await _incrementContributionScore(15);
        } else {
          print("Nutrition image upload failed: $nutritionImageErrorMsg");
        }
      }

      // Fermer le dialogue de chargement en cas de succès (avant d'afficher le dialogue de succès)
      // S'assurer que _loadingDialogContext est valide et que le widget est monté
      if (mounted && Navigator.of(_loadingDialogContext).canPop()) {
        Navigator.pop(_loadingDialogContext);
      }

      // --- Affichage du résultat final ---
      if (!mounted) return;

      if (frontImageSuccess) {
        String successMsg = s.productAndImageAddedSuccess;
        List<String> minorFailures = [];
        if (!ingredientsImageSuccess && _selectedIngredientImageFile != null) {
          minorFailures
              .add(s.ingredientPhotoUploadFailed(ingredientsImageErrorMsg));
        }
        if (!nutritionImageSuccess && _selectedNutritionImageFile != null) {
          minorFailures
              .add(s.nutritionPhotoUploadFailed(nutritionImageErrorMsg));
        }

        if (minorFailures.isNotEmpty) {
          successMsg += "\n\n${s.however}:\n- ${minorFailures.join('\n- ')}";
        }
        _showSuccessDialog(message: successMsg);
      } else {
        _showErrorDialog(
            "${s.textDataSentButImageFailed}\n\n${s.imageUploadError}: $frontImageErrorMsg");
      }
    } catch (e) {
      // En cas d'erreur, fermer le dialogue de chargement s'il est ouvert
      if (mounted && Navigator.of(_loadingDialogContext).canPop()) {
        Navigator.pop(_loadingDialogContext);
      }
      if (!mounted) return;
      _showErrorDialog("${s.submissionError}\n${e.toString()}");
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  void _showErrorDialog(String message) {
    final s = S.of(this
        .context); // 'this.context' ou 'context' est le BuildContext de _AddProductState
    showCupertinoDialog(
      context: this.context, // Utilise le contexte du widget _AddProductState
      builder: (dialogContext) => CupertinoAlertDialog(
        // dialogContext est spécifique à cette alerte
        title: Text(s.errorTitle),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () =>
                Navigator.pop(dialogContext), // Ferme uniquement cette alerte
            child: Text(s.ok), // Utilisez s.ok pour la localisation
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog({String? message}) {
    final s = S.of(this.context);
    showCupertinoDialog(
      context: this.context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(s.successTitle),
        content: Text(message ?? s.productAndImageAddedSuccess),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(dialogContext); // Ferme ce dialogue d'alerte
              if (mounted) {
                Navigator.pop(this.context); // Retourne de la page AddProduct
              }
            },
            child: Text(s.validate),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String catName) {
    final s = S.of(this.context);
    final Map<String, IconData> currentCategoryIcons = {
      s.food: Icons.restaurant_menu,
      s.beauty: Icons.spa,
      s.petFood: Icons.pets,
      s.other: Icons.category,
    };
    final bool isSelected = category == catName;
    final IconData iconData = currentCategoryIcons[catName] ?? Icons.error;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            category = catName;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: isSelected ? 1.5 : 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: isSelected ? Colors.blue : Colors.grey.shade700,
                size: 28,
              ),
              const SizedBox(height: 6),
              Text(
                catName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue.shade900 : Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<String> currentCategories = [
      s.food,
      s.beauty,
      s.petFood,
      s.other,
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 48,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          CupertinoIcons.clear,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              s.addProductTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              s.addProductHelp,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300.withOpacity(0.7),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  s.barcodeLabel,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
                Text(
                  widget.barcode,
                  style: const TextStyle(color: Colors.blueGrey),
                )
              ]),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                s.productName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              textCapitalization: TextCapitalization.sentences,
              padding: const EdgeInsets.all(12),
              controller: _productNameController,
              placeholder: s.productNamePlaceholder,
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                s.brandName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            CupertinoTextField(
              textCapitalization: TextCapitalization.sentences,
              padding: const EdgeInsets.all(12),
              controller: _brandNameController,
              placeholder: s.brandNamePlaceholder,
            ),
            /*const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Origine des ingrédients",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            },
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _ingredientsFromUS,
                  onChanged: (v) =>
                      setState(() => _ingredientsFromUS = v ?? false),
                ),
                const SizedBox(width: 8),
                Expanded(child: Text("Ingrédients provenant des États‑Unis")),
              ],
            ),*/
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                s.category,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: currentCategories
                  .map((cat) => _buildCategoryButton(cat))
                  .toList(),
            ),
            const SizedBox(height: 24),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                s.photo,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _showImageSourceActionSheet(context, "product"),
                  child: Container(
                    width: 100,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    child: _selectedImageFile == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.camera_fill,
                                color: Colors.grey.shade600,
                                size: 28,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                s.addPhoto,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: FileImage(_selectedImageFile!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                (category != S.current.other)
                    ? GestureDetector(
                        onTap: () =>
                            _showImageSourceActionSheet(context, "ingredient"),
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.grey.shade400, width: 1),
                          ),
                          child: _selectedIngredientImageFile == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      CupertinoIcons.camera_fill,
                                      color: Colors.grey.shade600,
                                      size: 28,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      S.of(context).addIngredientPhoto,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: FileImage(
                                            _selectedIngredientImageFile!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      )
                    : Container(),
                const SizedBox(width: 16),
                (category == S.of(context).food)
                    ? GestureDetector(
                        onTap: () =>
                            _showImageSourceActionSheet(context, "nutrition"),
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.grey.shade400, width: 1),
                          ),
                          child: _selectedNutritionImageFile == null
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                        CupertinoIcons
                                            .camera_fill, // icône tableau
                                        color: Colors.grey.shade600,
                                        size: 28),
                                    const SizedBox(height: 4),
                                    Text(
                                      S
                                          .of(context)
                                          .nutritionTablePhoto, // ajoutez dans .arb : addNutritionPhoto = "Ajouter photo nutrition";
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black87, fontSize: 12),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: FileImage(
                                            _selectedNutritionImageFile!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).ingredientsOptional,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
                child: Container(
                  width: double
                      .infinity, // S'assure que le conteneur prend toute la largeur
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 16), // Ajustement du padding
                  decoration: BoxDecoration(
                    color: CupertinoColors
                        .tertiarySystemFill, // Couleur de fond de style iOS pour les champs
                    borderRadius: BorderRadius.circular(
                        8.0), // Rayon de bordure standard iOS
                    // Pas besoin de bordure explicite si on utilise les couleurs de fond Cupertino
                  ),
                  child: Row(
                    // Utiliser une Row pour le texte et l'icône
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Espace entre le texte et l'icône
                    children: [
                      Expanded(
                        // Pour que le texte prenne l'espace disponible et gère le débordement
                        child: Text(
                          _selectedOrigins.isEmpty
                              ? S.of(context).selectOriginCountries
                              : _selectedOrigins.join(", "),
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedOrigins.isEmpty
                                ? CupertinoColors
                                    .placeholderText // Couleur pour le placeholder
                                : CupertinoColors
                                    .label, // Couleur standard du texte
                          ),
                          overflow:
                              TextOverflow.ellipsis, // Gérer le texte long
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_forward,
                        color: CupertinoColors
                            .tertiaryLabel, // Couleur pour l'icône de chevron
                        size: 20,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  final result = await Navigator.push<Set<String>>(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => CountrySelectionScreen(
                        initiallySelected:
                            _selectedOrigins, // votre Set<String> existant
                      ),
                    ),
                  );
                  if (result != null) {
                    setState(() => _selectedOrigins = result);
                  }
                }),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: Colors.blue,
                onPressed: _isSubmitting ? null : _submitProduct,
                borderRadius: BorderRadius.circular(12),
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: _isSubmitting
                    ? const CupertinoActivityIndicator(color: Colors.white)
                    : Text(
                        s.validate,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
