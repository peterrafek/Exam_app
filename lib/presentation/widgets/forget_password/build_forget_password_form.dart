import 'package:exam_app/presentation/widgets/forget_password/title_and_subtitle.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/forget_password/request/forget_password_request_entity.dart';
import '../../viewmodel/cubits/forget_password_cubit.dart';
import '../../viewmodel/intents/forget_password_intent.dart';

class BuildForgetPasswordForm extends StatefulWidget {
  ForgetPasswordCubit forgetPasswordCubit;

  TextEditingController emailController = TextEditingController();

  BuildForgetPasswordForm(
      {super.key,
      required this.forgetPasswordCubit,
      required this.emailController});

  @override
  State<BuildForgetPasswordForm> createState() =>
      _BuildForgetPasswordFormState();
}

class _BuildForgetPasswordFormState extends State<BuildForgetPasswordForm> {
  final formKey = GlobalKey<FormState>();

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
              TitleAndSubtitle(),
              SizedBox(height: 30.h),
              EmailTextField(controller: widget.emailController),
              SizedBox(height: 50.h),
              BlueButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.forgetPasswordCubit.doIntent(
                        OnEnterdEmailIntent(
                          request: ForgetPasswordRequestEntity(
                            email: widget.emailController.text,
                          ),
                        ),
                      );
                    }
                  },
                  text: 'Continue')
            ]),
      ),
    );
  }
}
