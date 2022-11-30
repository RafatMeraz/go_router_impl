import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUtils {
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static const String versionManagementCollection = 'version_management';

  static Future<QuerySnapshot<Map<String, dynamic>>>
      getVersionManagementSpec() async {
    final result =
        await _firebaseFirestore.collection(versionManagementCollection).get();
    return result;
  }
}