import 'package:exam_app/presentation/widgets/reset_password/reset_password_title_and_sub_title.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/strings_manager.dart';
import '../../../domain/entities/reset_password/request/reset_password_request.dart';
import '../../viewmodel/cubits/reset_password/reset_password_cubit.dart';

class BuildResetPasswordForm extends StatelessWidget {
  const BuildResetPasswordForm({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    final passwordConfirmationController = TextEditingController();

    return Padding(
      padding: REdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResetPasswordTitleAndSubTitle(),
              SizedBox(height: 30.h),
              PasswordTextField(controller: passwordController),
              SizedBox(height: 25.h),
              PasswordConfirmationTextField(
                  controller: passwordConfirmationController,
                  confirmController: passwordController),
              SizedBox(height: 50.h),
              BlueButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<ResetPasswordCubit>(context)
                          .resetPassword(ResetPasswordRequestEntity(
                              email: email,
                              newPassword:
                                  passwordConfirmationController.text));
                    }
                  },
                  text: StringsManager.continueWord)
            ]),
      ),
    );
  }
}
