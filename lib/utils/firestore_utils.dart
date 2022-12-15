import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUtils {
  static const String versionManagementDatabase = 'version_management';
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  /// get documents of a collections
  static Future<QuerySnapshot> getDocumentSnapshots(
      String collectionPath) async {
    return await _firebaseFirestore.collection(collectionPath).get();
  }

  /// get query snapshots of a collections
  static Stream<QuerySnapshot<Map<String, dynamic>>> getQuerySnapshots(
      String collectionPath) {
    return _firebaseFirestore.collection(collectionPath).snapshots();
  }

  /// get a specific document by doc id
  static DocumentReference<Map<String, dynamic>> getDocumentByDocId(
      String collectionPath, String docId) {
    return _firebaseFirestore.collection(collectionPath).doc(docId);
  }
}
