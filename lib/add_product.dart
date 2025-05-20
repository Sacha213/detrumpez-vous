import 'dart:convert'; // Import pour jsonDecode
import 'dart:io';
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

  String? category;
  bool _isSubmitting = false;

  late final Map<String, IconData> categoryIcons;
  late final List<String> categories;

  File? _selectedImageFile;
  File? _selectedIngredientImageFile;
  final ImagePicker _picker = ImagePicker();
  int _contributionScore = 0; // Score de contribution

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

      if (pickedFile != null) {
        setState(() {
          if (type == "product") {
            _selectedImageFile = File(pickedFile.path);
          } else if (type == "ingredient") {
            _selectedIngredientImageFile = File(pickedFile.path);
          } else {
            // Handle error or unexpected type
            print("Unknown type: $type");
          }
        });
      }
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

  Future<void> _submitProduct() async {
    final s = S.of(this.context);
    final productName = _productNameController.text.trim();
    final brandName = _brandNameController.text.trim();
    //final ingredientsOrigin = (_ingredientsFromUS) ? "united-states" : "";
    if (productName.isEmpty || brandName.isEmpty) {
      _showErrorDialog(s.fillAllFields);
      return;
    }

    if (category == null) {
      _showErrorDialog(s.selectCategoryError);
      return;
    }

    if (_selectedImageFile == null) {
      _showErrorDialog(s.selectPhotoError);
      return;
    }

    if (category != s.other && _selectedIngredientImageFile == null) {
      _showErrorDialog(s.selectPhotoError);
      return;
    }

    setState(() => _isSubmitting = true);
    _showLoadingDialog(s.sendingInfo);

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

    const String userId = apiUserId;
    const String password = apiPassword;

    try {
      final textData = {
        "code": widget.barcode,
        "product_name": productName,
        "brands": brandName,
        //"origins": ingredientsOrigin,
        "user_id": userId,
        "password": password,
        "comment": "Ajout via l'application Détrumpez-vous",
      };

      final textResponse = await http.post(textUri, body: textData);

      bool textSuccess = textResponse.statusCode == 200;

      if (!textSuccess) {
        print(textResponse.body);
        throw Exception(s.textSubmissionFailed(textResponse.statusCode));
      }

      // upload de l’image « front »
      String imageFieldId = 'front_fr';
      String fileFieldName = 'imgupload_$imageFieldId';

      var imageRequest = http.MultipartRequest('POST', imageUri);
      imageRequest.fields['code'] = widget.barcode;
      imageRequest.fields['user_id'] = userId;
      imageRequest.fields['password'] = password;
      imageRequest.fields['imagefield'] = imageFieldId;

      var stream = http.ByteStream(
          DelegatingStream.typed(_selectedImageFile!.openRead()));
      var length = await _selectedImageFile!.length();
      var multipartFile = http.MultipartFile(
        fileFieldName,
        stream,
        length,
        filename: basename(_selectedImageFile!.path),
      );
      imageRequest.files.add(multipartFile);

      var imageResponse = await imageRequest.send();
      var imageResponseBody = await imageResponse.stream.bytesToString();

      // upload de l’image « ingredient » SEULEMENT SI ELLE EXISTE
      if (_selectedIngredientImageFile != null) {
        // upload de l’image « ingredient »
        imageFieldId = 'ingredients';
        fileFieldName = 'imgupload_$imageFieldId';

        imageRequest = http.MultipartRequest('POST', imageUri);
        imageRequest.fields['code'] = widget.barcode;
        imageRequest.fields['user_id'] = userId;
        imageRequest.fields['password'] = password;
        imageRequest.fields['imagefield'] = imageFieldId;

        stream = http.ByteStream(
            DelegatingStream.typed(_selectedIngredientImageFile!.openRead()));
        length = await _selectedIngredientImageFile!.length();
        multipartFile = http.MultipartFile(
          fileFieldName,
          stream,
          length,
          filename: basename(_selectedIngredientImageFile!.path),
        );
        imageRequest.files.add(multipartFile);

        imageResponse = await imageRequest.send();
        imageResponseBody = await imageResponse.stream.bytesToString();
      }

      if (mounted) Navigator.pop(this.context);

      if (!mounted) return;

      bool imageUploadSuccess = false;
      String imageErrorDetail = "";
      if (imageResponse.statusCode == 200) {
        try {
          var decodedResponse = jsonDecode(imageResponseBody);
          if (decodedResponse is Map &&
              decodedResponse['status'] == 'status ok') {
            imageUploadSuccess = true;
            _incrementContributionScore(
                20); // Ajoute 20 points pour l'upload d'image
          } else if (decodedResponse is Map &&
              decodedResponse.containsKey('error')) {
            imageErrorDetail = decodedResponse['error'];
          } else {
            imageErrorDetail = "Réponse inattendue du serveur.";
          }
        } catch (e) {
          imageErrorDetail = "Réponse invalide du serveur.";
        }
      } else {
        imageErrorDetail = "Code ${imageResponse.statusCode}";
      }

      if (imageUploadSuccess) {
        _showSuccessDialog();
      } else {
        String errorMessage = s.imageUploadError;
        if (imageErrorDetail.isNotEmpty) {
          errorMessage += "\n($imageErrorDetail)";
        }
        _showErrorDialog("${s.textDataSentButImageFailed}\n\n$errorMessage");
      }
    } catch (e) {
      if (mounted) Navigator.pop(this.context);

      if (!mounted) return;
      _showErrorDialog("${s.submissionError}\n${e.toString()}");
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  void _showLoadingDialog(String message) {
    showCupertinoDialog(
      context: this.context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CupertinoActivityIndicator(radius: 15),
              const SizedBox(height: 16),
              Text(message, style: const TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    final s = S.of(this.context);
    showCupertinoDialog(
      context: this.context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(s.errorTitle),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    final s = S.of(this.context);
    showCupertinoDialog(
      context: this.context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(s.successTitle),
        content: Text(s.productAndImageAddedSuccess),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pop(this.context);
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
            ),
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
              ],
            ),
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
