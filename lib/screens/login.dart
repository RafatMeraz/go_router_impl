import 'package:flutter/material.dart';
import 'package:go_router_impl/app.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /// navigate with context
            loginState.changeLoggedInState(true);
            // context.goNamed(Routes.home);
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
