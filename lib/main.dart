import 'package:flutter/cupertino.dart';
import 'package:go_router_impl/app.dart';
import 'package:go_router_impl/utils/firebase_service.dart';
import 'package:go_router_impl/utils/version_manager/data_source/firebase_version_config_data_source.dart';
import 'package:go_router_impl/utils/version_manager/version_manager.dart';

void main() async {
  await FirebaseService.initFirebase();
  await VersionManager.initVersionManager(FirebaseVersionConfigDataSource());
  runApp(MyApp());
}