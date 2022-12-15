import '../version_config.dart';

abstract class VersionConfigDataSource {
  Future<List<VersionConfig>> getVersionConfig();
}
