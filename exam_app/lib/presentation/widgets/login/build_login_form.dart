import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/login/requests/login/login_request.dart';
import '../../viewmodel/cubits/login/log_in_cubit.dart';
import '../../viewmodel/intents/login/log_in_intent.dart';
import 'check_box_and_forget_password_raw.dart';

class BuildLoginForm extends StatefulWidget {
  LogInCubit logInCubit;

  BuildLoginForm({super.key, required this.logInCubit});

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          EmailTextField(controller: emailController),
          SizedBox(height: 24.h),
          PasswordTextField(controller: passwordController),
          RememberMeAndForgetPasswordRow(
            isChecked: widget.logInCubit.isChecked,
            onCheckedChanged: (bool? value) {
              setState(() {
                widget.logInCubit.isChecked = value ?? false;
              });
            },
            onForgetPassword: () {
              Navigator.pushReplacementNamed(
                  context, RoutesManager.forgetPassword);
            },
          ),
          SizedBox(height: 50.h),
          BlueButton(
            text: StringsManager.logInWord,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                widget.logInCubit.doIntent(
                  OnLogInClickIntent(
                    request: LoginRequestEntity(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(height: 10.h),
          UnderButtonRow(
            behindUnderLineText: StringsManager.dontHaveAnAccountStatement,
            underLineText: StringsManager.signUpWord,
            onTapClick: () {
              Navigator.pushNamed(context, RoutesManager.signUp);
            },
          ),
        ]),
      ),
    );
  }
}
