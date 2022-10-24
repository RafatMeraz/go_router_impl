import 'package:flutter/cupertino.dart';
import 'package:go_router_impl/app.dart';
import 'package:go_router_impl/utils/firebase_service.dart';

void main() async {
  await FirebaseService.initFirebase();
  runApp(MyApp());
}