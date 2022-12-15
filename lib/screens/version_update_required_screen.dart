import 'package:flutter/material.dart';

class VersionUpdateRequiredScreen extends StatefulWidget {
  static bool isVisible = false;
  VersionUpdateRequiredScreen({Key? key}) : super(key: key);

  @override
  State<VersionUpdateRequiredScreen> createState() => _VersionUpdateRequiredScreenState();
}

class _VersionUpdateRequiredScreenState extends State<VersionUpdateRequiredScreen> {

  @override
  void initState() {
    super.initState();
    VersionUpdateRequiredScreen.isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Update required',
              style: TextStyle(fontSize: 32, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Text(
                'To use this module you need to update your app from app store',
                textAlign: TextAlign.center),
            const Spacer(),
            ButtonBar(
              children: [
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
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    VersionUpdateRequiredScreen.isVisible = false;
    super.dispose();
  }
}
