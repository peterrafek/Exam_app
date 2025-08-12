import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart';
import 'package:exam_app/presentation/viewmodel/intents/forget_password_intent.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../domain/entities/forget_password/requests/forget_password/forget_password_request.dart';

class BuildForgetPasswordForm extends StatefulWidget {
  ForgetPasswordCubit forgetPasswordCubit;

  BuildForgetPasswordForm({super.key, required this.forgetPasswordCubit});

  @override
  State<BuildForgetPasswordForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildForgetPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
              Text(
                StringsManager.forgetPasswordTitle,
                style: AppStyle.forgetPasswordTitle,
              ),
              SizedBox(height: 15.h),
              Text(
                textAlign: TextAlign.center,
                StringsManager.forgetPasswordSubTitle,
                style: AppStyle.forgetPasswordSubtitle,
              ),
              SizedBox(height: 30.h),
              EmailTextField(controller: emailController),
              SizedBox(height: 50.h),
              BlueButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.forgetPasswordCubit.doIntent(
                        OnConfirmEmailForgetPasswordClickIntent(
                          request: ForgetPasswordRequestEntity(
                              email: emailController.text),
                        ),
                      );
                    }
                  },
                  text: StringsManager.continueWord),
            ]),
      ),
    );
  }
}
