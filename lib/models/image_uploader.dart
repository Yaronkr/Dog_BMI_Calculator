import 'package:healthy_dog_calculator/src/import.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import '../services/cloud_api.dart';

class ImageUploader extends ChangeNotifier {
  File? _image = null;
  Uint8List? _imageBytes = null;
  final ImagePicker _picker = ImagePicker();
  CloudApi? _cloudApi;
  late String _imageName;

  void _saveImage() async {
    final response = await _cloudApi!.save(_imageName, _imageBytes!);
  }

  void getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageBytes = _image!.readAsBytesSync();
      _imageName = _image!.path.split('/').last;
      _saveImage();
      notifyListeners();
    }
  }

  File? get image => _image;

  Uint8List? get imageBytes {
    return _imageBytes;
    notifyListeners();
  }

  void resetImageBytes() {
    _imageBytes = null;
    notifyListeners();
  }

  void loadCloudApi() {
    _imageBytes = null;
    rootBundle.loadString('assets/credentials.json').then((json) {
      _cloudApi = CloudApi(json);
    });
  }
}
