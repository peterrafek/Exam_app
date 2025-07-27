
import 'package:flutter/material.dart';

import '../presentation/view/auth/login/log_in.dart';


class RoutesManager {
  static const String logIn = '/logIn';
  static const String forgetPassword = '/forgetPassword';
  static const String emailVerification = '/emailVerification';
  static const String resetPassword = '/resetPassword';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case logIn:
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );
    }
  }
}
