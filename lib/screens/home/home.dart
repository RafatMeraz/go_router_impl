import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_impl/app.dart';
import 'package:go_router_impl/utils/routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                  context.goNamed(Routes.products);
                },
                child: const Text('Products')),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.carts);
                },
                child: const Text('Carts')),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.profile);
                },
                child: const Text('Profile')),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.personalInfo);
                },
                child: const Text('Personal Info')),
          ],
        ),
      ),
    );
  }
}
