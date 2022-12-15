import 'package:go_router_impl/utils/version_manager/module_enums.dart';

class VersionConfig {
  final Module module;
  final String androidMinimumVersion, iOSMinimumVersion;

  VersionConfig(
      {required this.module,
      required this.androidMinimumVersion,
      required this.iOSMinimumVersion});
}
