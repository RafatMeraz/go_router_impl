import 'package:flutter/material.dart';
import 'package:go_router_impl/app.dart';
import 'package:go_router_impl/utils/firebase_messaging_service.dart';
import 'package:go_router_impl/utils/firebase_service.dart';
import 'package:go_router_impl/utils/routes.dart';
import 'package:go_router_impl/utils/version_manager/module_enums.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseService.getDeviceToken().then((value) {
        FirebaseMessagingService.initFirebaseNotification().then((value) {
          FirebaseMessagingService.listenToFirebasePushNotification();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
              onPressed: () {
                loginState.changeLoggedInState(false);
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Routes.goNamed(
                      routeName: Routes.products, moduleName: Module.products);
                },
                child: const Text('Products')),
            ElevatedButton(
                onPressed: () {
                  Routes.goNamed(
                      routeName: Routes.carts, moduleName: Module.carts);
                },
                child: const Text('Carts')),
            ElevatedButton(
                onPressed: () {
                  Routes.goNamed(
                      routeName: Routes.profile, moduleName: Module.profile);
                },
                child: const Text('Profile')),
            ElevatedButton(
                onPressed: () {
                  Routes.goNamed(
                      routeName: Routes.personalInfo, moduleName: Module.profile);
                },
                child: const Text('Personal Info')),
          ],
        ),
      ),
    );
  }
}
