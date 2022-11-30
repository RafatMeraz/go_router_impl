import 'dart:io';

import 'package:go_router_impl/utils/firestore_utils.dart';

abstract class VersionManagementService {
  static const String attendance = 'attendance';
  static const String attendanceReminder = 'attendance_reminder';
  static const String leave = 'leave';
  static const String login = 'login';
  static const String task = 'task';
  static Map<String, Map<String, String>> _moduleVersions = {};

  void getModuleVersions() async {
    FirestoreUtils.getVersionManagementSpec().then((versionData) {
      for (var element in versionData.docs) {
        final data = element.data();
        _moduleVersions[element.id] = {
          'android': data['android'],
          'ios': data['ios'],
        };
      }
    });
  }

  bool checkModuleVersion(String moduleName) {
    if (_moduleVersions.containsKey(moduleName)) {
      final moduleVersionInfo = _moduleVersions[moduleName];
      if (Platform.isAndroid) {
        if (moduleVersionInfo['android'] == '1.0.2') {

        }
      } else {

      }
    } else {
      return false;
    }
  }


}