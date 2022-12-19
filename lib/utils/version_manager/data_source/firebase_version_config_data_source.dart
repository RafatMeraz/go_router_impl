import 'package:go_router_impl/utils/version_manager/data_source/version_config_data_source.dart';
import 'package:go_router_impl/utils/version_manager/module_enums.dart';
import 'package:go_router_impl/utils/version_manager/version_config.dart';

import '../../firestore_utils.dart';

class FirebaseVersionConfigDataSource implements VersionConfigDataSource {
  @override
  Future<List<VersionConfig>> getVersionConfig() async {
    final List<VersionConfig> listOfVersionConfig = [];
    final documents = await FirestoreUtils.getDocumentSnapshots(
        FirestoreUtils.versionManagementDatabase);
    for (var element in documents.docs) {
      final Module moduleName = stringToModuleName(element.id);
      if (moduleName != Module.notFound) {
        final VersionConfig versionConfig = VersionConfig(
            module: moduleName,
            androidMinimumVersion: element.get('android'),
            iOSMinimumVersion: element.get('ios'));
        listOfVersionConfig.add(versionConfig);
      }
    }
    return listOfVersionConfig;
  }
}
