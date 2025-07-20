import 'package:exam_app/presentation/widgets/forget_password/build_forget_password_form.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/di.dart';
import '../../../../core/routes_manager.dart';
import '../../../viewmodel/cubits/forget_password_cubit.dart';
import '../../../viewmodel/states/forget_password_state.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  ForgetPasswordCubit forgetPasswordCubit = getIt.get<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        bloc: forgetPasswordCubit,
        listener: (context, state) {
          switch (state) {
            case ForgetPasswordInitialState():
              break;
            case ForgetPasswordLoadingState():
              showLoadingDialog(context, color: ColorsManager.blueButton);
            case ForgetPasswordSuccessState():
              Navigator.pop(context);
              showAppSnackBar(context, "OTP sent successfully.", Colors.green);
              Navigator.pushReplacementNamed(
                  context, RoutesManager.emailVerification,
                  arguments: emailController.text);
            case ForgetPasswordErrorState():
              Navigator.pop(context);
              showAppSnackBar(context, 'Error', Colors.red);
          }
        },
        child: BuildForgetPasswordForm(
            forgetPasswordCubit: forgetPasswordCubit,
            emailController: emailController),
      ),
    );
  }
}
