import 'dart:io';
abstract class StorageServices {
  Future<String> uploadImage({required String path ,  required File file});
}