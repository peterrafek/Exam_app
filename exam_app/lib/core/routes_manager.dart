import 'package:exam_app/domain/entities/exams/response/exams_response.dart';
import 'package:exam_app/domain/entities/subjects/subjects_response.dart';
import 'package:exam_app/presentation/view/auth/forget_password/forget_password.dart';
import 'package:exam_app/presentation/view/auth/reset_password/reset_password.dart';
import 'package:exam_app/presentation/view/home/home.dart';
import 'package:exam_app/presentation/viewmodel/cubits/verification/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/view/auth/login/log_in.dart';
import '../presentation/view/auth/sign_up/sign_up_screen.dart';
import '../presentation/view/auth/verification/email_verfication.dart';
import '../presentation/view/exams/exam_start_page.dart';
import '../presentation/view/exams/exams_page.dart';
import '../presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart';
import '../presentation/viewmodel/cubits/reset_password/reset_password_cubit.dart';
import 'di.dart';

class RoutesManager {
  static const String signUp = '/signUp';
  static const String logIn = '/logIn';
  static const String forgetPassword = '/forgetPassword';
  static const String emailVerification = '/emailVerification';
  static const String resetPassword = '/resetPassword';
  static const String home = '/home';
  static const String exams = '/exams';
  static const String examStart = '/examStart';

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
          builder: (context) => SignUpScreen(),
        );
      case emailVerification:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<ForgetPasswordCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<VerificationCubit>(),
            ),
          ], child: EmailVerification(email: args)),
        );
      case resetPassword:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ResetPassword(email: args),
          ),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case exams:
        final args = settings.arguments as SubjectEntity;
        return MaterialPageRoute(
          builder: (context) => ExamsPage(item: args),
        );
      case examStart:
        final args = settings.arguments as ExamEntity;
        return MaterialPageRoute(
          builder: (context) => ExamStartPage(
            item: args,
          ),
        );
    }
  }
}
