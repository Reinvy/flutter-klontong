import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Storage {
  final storage = FirebaseStorage.instance;
  final path = "products";

  Future<String> uploadImage(XFile image) async {
    try {
      final ref = storage.ref().child("$path/${image.name}");
      await ref.putFile(File(image.path));
      return await ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteImage(String url) async {
    try {
      final ref = storage.refFromURL(url);
      await ref.delete();
    } catch (e) {
      rethrow;
    }
  }
}
