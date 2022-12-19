import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigScreen extends StatefulWidget {
  RemoteConfigScreen({Key? key}) : super(key: key);

  @override
  State<RemoteConfigScreen> createState() => _RemoteConfigScreenState();
}

class _RemoteConfigScreenState extends State<RemoteConfigScreen> {
  final FirebaseRemoteConfig _firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  @override
  void initState() {
    super.initState();
    _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 20),
      minimumFetchInterval: const Duration(minutes: 5),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Config'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final FirebaseRemoteConfig firebaseRemoteConfig = snapshot.data as FirebaseRemoteConfig;
            return Column(
              children: [
                Text(firebaseRemoteConfig.getAll().toString())
              ],
            );
          }
          else {
            return const Text('Loading');
          }
        },
      ),
    );
  }

  Future<FirebaseRemoteConfig> getData() async {
    await _firebaseRemoteConfig.fetchAndActivate();
    print(_firebaseRemoteConfig.lastFetchTime);
    print(_firebaseRemoteConfig.lastFetchStatus);
    return _firebaseRemoteConfig;
  }
}
