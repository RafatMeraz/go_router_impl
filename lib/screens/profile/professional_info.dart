import 'package:flutter/material.dart';

class ProfessionalInfo extends StatelessWidget {
  const ProfessionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional Info'),
      ),
      body: const Center(
        child: Text('Professional Info'),
      ),
    );
  }
}
