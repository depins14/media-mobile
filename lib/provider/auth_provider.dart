import 'package:flutter/material.dart';
import 'package:media/model/user_model.dart';
import 'package:media/service/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    required String nis,
    required String password,
  }) async {
    try {
      UserModel user = await AuthServices().login(
        nis: nis,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
