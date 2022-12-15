import 'package:flutter/material.dart';

void showUpdateRequiredDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            'Update required',
            style: TextStyle(color: Colors.black),
          ),
          content: const Text(
              'To use this module you need to update your app from app store'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(onPressed: () {}, child: const Text('Update')),
          ],
        );
      });
}
