import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  /// change login state
  void changeLoggedInState(bool loginState) {
    _isLoggedIn = loginState;
    notifyListeners();
  }
}
