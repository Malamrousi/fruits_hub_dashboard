import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:furit_hub_dashbboard/core/services/storage_services.dart';
import 'package:path/path.dart' as b;

class FirebaseStorageServices implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage({required String path, required File file}) async {
    String fileName = b.basename(file.path);
    String extension = b.extension(file.path).toLowerCase();
   var imageRef = storageRef.child('$path/$fileName.$extension');
    imageRef.putFile(file);
   var fileUrl = await imageRef.getDownloadURL();
    return fileUrl;
  }
}
