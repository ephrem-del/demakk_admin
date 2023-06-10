import 'package:demakk_admin/resources/base_auth_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeProvider with ChangeNotifier {
  // final BaseAuthUser demakkEmployee;
  bool _isLoggedIn = false;
  BaseAuthUser? _currentUser;

  // BaseAuthUser get currentUser => demakkEmployee;
  bool get isLoggedIn => _isLoggedIn;
  BaseAuthUser? get currentUser {
    if (_isLoggedIn) {
      return _currentUser;
    }
    return null;
  }

  // set employee(BaseAuthUser employee) {
  //   _isLoggedIn = true;
  //   _currentUser = employee;
  //   print(_currentUser);
  //   print(_isLoggedIn);
  //   notifyListeners();
  // }

  void login(BaseAuthUser employee) {
    _isLoggedIn = true;
    _currentUser = employee;
    print(_currentUser);
    print(_isLoggedIn);
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _currentUser = null;
    notifyListeners();
  }
}
