import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furit_hub_dashbboard/core/services/data_base_services.dart';

class FireStoreServices implements DataBaseServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
       String? uid}) async {
    if (uid != null) {
      await _firestore.collection(path).doc(uid).set(data);
    } else {
      await _firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String uid}) async {
    return (await _firestore.collection(path).doc(uid).get()).data()!;
  }

  @override

  Future<bool> isDataExist({required String path, required String uid}) async{
    var data = await _firestore.collection(path).doc(uid).get();
    return data.exists;
  }
}
