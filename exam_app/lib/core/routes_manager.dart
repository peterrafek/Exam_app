import 'package:exam_app/presentation/view/auth/forget_password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/view/auth/login/log_in.dart';
import '../presentation/view/auth/sign_up/sign_up_screen.dart';



class RoutesManager {
  static const String signUp = '/signUp';
  static const String logIn = '/logIn';
  static const String forgetPassword = '/forgetPassword';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {

      case logIn:
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );
      case forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case signUp:
        return MaterialPageRoute(
          builder: (context) =>   SignUpScreen(),
        );



    }
  }
}
