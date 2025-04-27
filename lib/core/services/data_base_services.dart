
abstract class DataBaseServices {
  Future<void> addData({required String path, required Map<String, dynamic> data ,  String? uid});
  Future<Map<String, dynamic>> getData({required String path, required String uid});
  Future<bool> isDataExist({required String path, required String uid});
}