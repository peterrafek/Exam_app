import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/view/auth/login/log_in.dart';

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
    }
  }
}
