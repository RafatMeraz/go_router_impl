import 'package:package_info_plus/package_info_plus.dart';

class AppInfoUtils {
  static Future<String> getCurrentAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }
}