
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentaion/features/auth/sign_up/sign_up_screen.dart';


class RoutesManager {
  static const String signUp = '/signUp';

  static const String logIn = '/logIn';
  static const String forgetPassword = '/forgetPassword';
  static const String emailVerification = '/emailVerification';
  static const String resetPassword = '/resetPassword';
  static const String baseTab = '/baseTab';
  static const String exams = '/exams';
  static const String examStart = '/examStart';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {

      case signUp:
        return MaterialPageRoute(
          builder: (context) =>   SignUpScreen(),
        );


    }
  }
}
