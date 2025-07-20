import 'package:exam_app/presentation/viewmodel/intents/reset_password_intent.dart';
import 'package:exam_app/presentation/widgets/reset_password/reset_password_title_and_subtitle.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/reset_password/request/reset_password_request_entity.dart';
import '../../viewmodel/cubits/reset_password_cubit.dart';

class BuildResetPasswordForm extends StatefulWidget {
  BuildResetPasswordForm(
      {super.key, required this.email, required this.resetPasswordCubit});

  ResetPasswordCubit resetPasswordCubit;

  final String email;

  @override
  State<BuildResetPasswordForm> createState() => _BuildResetPasswordFormState();
}

class _BuildResetPasswordFormState extends State<BuildResetPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResetPasswordTitleAndSubtitle(),
              SizedBox(height: 30.h),
              PasswordTextField(controller: passwordController),
              SizedBox(height: 25.h),
              PasswordConfirmationTextField(
                controller: passwordConfirmationController,
                confirmController: passwordController,
              ),
              SizedBox(height: 50.h),
              BlueButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.resetPasswordCubit.doIntent(
                      OnContinueButtonPressedIntent(
                        ResetPasswordRequestEntity(
                            email: widget.email,
                            newPassword: passwordConfirmationController.text),
                      ),
                    );
                  }
                },
                text: 'Continue',
              )
            ]),
      ),
    );
  }
}
