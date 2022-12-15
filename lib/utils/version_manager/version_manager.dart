import 'dart:io';

import 'package:go_router_impl/utils/version_manager/app_info_utils.dart';
import 'package:go_router_impl/utils/version_manager/data_source/version_config_data_source.dart';
import 'package:go_router_impl/utils/version_manager/module_enums.dart';
import 'package:go_router_impl/utils/version_manager/version_config.dart';

class VersionManager {
  static late VersionConfigDataSource _versionConfigDataSource;
  static late String _currentAppVersion;
  static late List<VersionConfig> _listOfVersionConfig;

  VersionManager._();

  static Future<void> initVersionManager(
      VersionConfigDataSource versionConfigDataSource) async {
    await _getAppCurrentVersion();
    _versionConfigDataSource = versionConfigDataSource;
    _listOfVersionConfig = await _versionConfigDataSource.getVersionConfig();
  }

  static Future _getAppCurrentVersion() async {
    _currentAppVersion = await AppInfoUtils.getCurrentAppVersion();
  }

  static bool minVersionSatisfied(Module module) {
    for (VersionConfig versionConfig in _listOfVersionConfig) {
      if (versionConfig.module == module) {
        if (Platform.isAndroid) {
          return AppInfoUtils.getExtendedVersionNumber(
                  versionConfig.androidMinimumVersion) <=
              AppInfoUtils.getExtendedVersionNumber(_currentAppVersion);
        } else {
          return AppInfoUtils.getExtendedVersionNumber(
                  versionConfig.iOSMinimumVersion) <=
              AppInfoUtils.getExtendedVersionNumber(_currentAppVersion);
        }
      }
    }
    return true;
  }
}
