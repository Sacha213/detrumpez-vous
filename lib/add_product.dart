import 'dart:convert'; // Import pour jsonDecode
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:detrumpezvous/generated/l10n.dart'; // Assure-toi que c'est importé
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart'; // Import pour StreamGroup et ByteStream
import 'package:path/path.dart'; // Import pour basename

class AddProduct extends StatefulWidget {
  final String barcode;

  const AddProduct({super.key, required this.barcode});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  String? category;
  bool _isSubmitting = false;

  late final Map<String, IconData> categoryIcons;
  late final List<String> categories;

  File? _selectedImageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    categories = [
      S.current.alimentation,
      S.current.cosmetique,
      S.current.alimentationAnimaux,
      S.current.autre,
    ];
    categoryIcons = {
      S.current.alimentation: Icons.restaurant_menu,
      S.current.cosmetique: Icons.spa,
      S.current.alimentationAnimaux: Icons.pets,
      S.current.autre: Icons.category,
    };
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _brandNameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1000,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImageFile = File(pickedFile.path);
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

  void _showImageSourceActionSheet(BuildContext context) {
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
              _pickImage(ImageSource.camera);
            },
          ),
          CupertinoActionSheetAction(
            child: Text(s.gallery),
            onPressed: () {
              Navigator.pop(sheetContext);
              _pickImage(ImageSource.gallery);
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

    setState(() => _isSubmitting = true);
    _showLoadingDialog(s.sendingInfo);

    final Map<String, String> textApiUrls = {
      s.alimentation: "https://world.openfoodfacts.org/cgi/product_jqm2.pl",
      s.cosmetique: "https://world.openbeautyfacts.org/cgi/product_jqm2.pl",
      s.alimentationAnimaux:
          "https://world.openpetfoodfacts.org/cgi/product_jqm2.pl",
      s.autre: "https://world.openproductsfacts.org/cgi/product_jqm2.pl",
    };
    final Map<String, String> imageApiUrls = {
      s.alimentation:
          "https://world.openfoodfacts.org/cgi/product_image_upload.pl",
      s.cosmetique:
          "https://world.openbeautyfacts.org/cgi/product_image_upload.pl",
      s.alimentationAnimaux:
          "https://world.openpetfoodfacts.org/cgi/product_image_upload.pl",
      s.autre:
          "https://world.openproductsfacts.org/cgi/product_image_upload.pl",
    };

    final String textUrlString = textApiUrls[category] ?? textApiUrls[s.autre]!;
    final String imageUrlString =
        imageApiUrls[category] ?? imageApiUrls[s.autre]!;
    final textUri = Uri.parse(textUrlString);
    final imageUri = Uri.parse(imageUrlString);

    const String userId = "detrumpezvous";
    const String password = "Mardyn-3sucgy-carvex";

    try {
      final textData = {
        "code": widget.barcode,
        "product_name": productName,
        "brands": brandName,
        "user_id": userId,
        "password": password,
        "comment": "Ajout via l'application Détrompez-vous",
      };

      final textResponse = await http.post(textUri, body: textData);

      bool textSuccess = textResponse.statusCode == 200;

      if (!textSuccess) {
        throw Exception(s.textSubmissionFailed(textResponse.statusCode));
      }

      const String imageFieldId = 'front_fr';
      const String fileFieldName = 'imgupload_$imageFieldId';

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
      final imageResponseBody = await imageResponse.stream.bytesToString();
      

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
      s.alimentation: Icons.restaurant_menu,
      s.cosmetique: Icons.spa,
      s.alimentationAnimaux: Icons.pets,
      s.autre: Icons.category,
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
      s.alimentation,
      s.cosmetique,
      s.alimentationAnimaux,
      s.autre,
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
            Center(
              child: Container(
                width: 48,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            const SizedBox(height: 16),
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
              padding: const EdgeInsets.all(12),
              controller: _brandNameController,
              placeholder: s.brandNamePlaceholder,
            ),
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
            GestureDetector(
              onTap: () => _showImageSourceActionSheet(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
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
