import 'package:exam_app/domain/entities/login/response/login_response.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';




@singleton
class UserProvider extends ChangeNotifier {
  LoginResponseEntity? _userLoginInfo;

  LoginResponseEntity? get userLoginInfo => _userLoginInfo;

  void changeUserLoginInfo(LoginResponseEntity? newResponse) {
    if (_userLoginInfo != newResponse) {
      _userLoginInfo = newResponse;
      notifyListeners();
    }
  }
}
