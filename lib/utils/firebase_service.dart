import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

abstract class FirebaseService {
  static Future<void> initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  static Future<String?> getDeviceToken() async {
    final firebaseToken = await FirebaseMessaging.instance.getToken();
    print('device token => ${firebaseToken ?? ''}');
    return firebaseToken;
  }

  static Future<void> deleteDeviceToken() async {
    await FirebaseMessaging.instance.deleteToken();
  }
}
