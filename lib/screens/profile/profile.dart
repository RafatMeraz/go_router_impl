import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/routes.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.personalInfo);
                },
                child: const Text('Personal Info')),
            ElevatedButton(
                onPressed: () {
                  context.goNamed(Routes.professionalInfo);
                },
                child: const Text('Professional Info')),
          ],
        ),
      ),
    );
  }
}
