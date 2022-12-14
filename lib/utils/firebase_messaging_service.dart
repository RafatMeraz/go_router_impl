import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_impl/app.dart';

abstract class FirebaseMessagingService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  /// initialize the firebase push notification
  static Future<void> initFirebaseNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  /// listen to firebase push notification
  static Future<void> listenToFirebasePushNotification() async {
    FirebaseMessaging.onMessage.listen((message) {
      _takeActionFromPushNotification(message.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _takeActionFromPushNotification(message.data);
    });
  }

  static void _takeActionFromPushNotification(Map<String, dynamic> messageMap) {
    if (messageMap['shouldNavigate'] == 'true') {
      final Map<String, dynamic> decodedJson =
          jsonDecode(messageMap['params'] ?? '{}');
      final Map<String, String> screenParams = {};
      decodedJson.forEach((key, value) {
        screenParams[key] = value.toString();
      });
      _navigateToScreen(messageMap['screenName'], screenParams,
          navigatorType: messageMap['navigationType']);
    }
  }

  static void _navigateToScreen(String screenName, Map<String, String> params,
      {String? navigatorType}) {
    WidgetsFlutterBinding.ensureInitialized();
    if ((navigatorType ?? 'go') == 'go') {
      MyApp.globalGoNavigator!.goNamed(screenName, params: params);
    } else {
      MyApp.globalGoNavigator!.pushNamed(screenName, params: params);
    }
  }
}
