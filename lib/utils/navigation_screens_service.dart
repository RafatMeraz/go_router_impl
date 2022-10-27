import 'package:flutter/material.dart';
import 'package:go_router_impl/app.dart';
import 'package:go_router_impl/screens/error_screen.dart';

import '../screens/home/home.dart';

abstract class NavigationScreenService {
  static Widget _getScreen(String name) {
    switch (name) {
      case 'home':
        return const Home();
      default:
        return const ErrorScreen();
    }
  }

  static Future<void> navigateToScreen(String name) {
    return Navigator.push(MyApp.globalGoNavigator!,
        MaterialPageRoute(builder: (context) => _getScreen(name)));
  }
}
