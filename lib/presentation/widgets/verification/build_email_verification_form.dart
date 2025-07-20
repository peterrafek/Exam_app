import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/presentation/viewmodel/cubits/verification_cubit.dart';
import 'package:exam_app/presentation/viewmodel/intents/forget_password_intent.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:exam_app/presentation/widgets/verification/build_pin_code_textfield.dart';
import 'package:exam_app/presentation/widgets/verification/email_verification_title_und_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/verification/request/verify_request_entity.dart';
import '../../viewmodel/cubits/forget_password_cubit.dart';
import '../../viewmodel/intents/verification_intent.dart';

class BuildEmailVerificationForm extends StatefulWidget {
  BuildEmailVerificationForm({
    super.key,
    required this.email,
    required this.verificationCubit,
  });

  VerificationCubit verificationCubit;
  final String email;

  @override
  State<BuildEmailVerificationForm> createState() =>
      _BuildEmailVerificationFormState();
}

class _BuildEmailVerificationFormState
    extends State<BuildEmailVerificationForm> {
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
              EmailVerificationTitleUndSubtitle(),
              SizedBox(height: 30.h),
              BuildPinCodeTextfield(
                onCompleted: (code) {
                  widget.verificationCubit.doIntent(
                    OnContinueClickIntent(
                      request: VerifyRequsetEntity(resetCode: code),
                    ),
                  );
                },
                onSubmitted: (code) {
                  widget.verificationCubit.doIntent(
                    OnContinueClickIntent(
                      request: VerifyRequsetEntity(resetCode: code),
                    ),
                  );
                },
              ),
              SizedBox(height: 50.h),
              UnderButtonRow(
                behindUnderLineText: 'Didn\'t receive code? ',
                underLineText: 'Resend',
                onTapClick: () {
                  BlocProvider.of<ForgetPasswordCubit>(context).doIntent(
                    OnEnterdEmailIntent(
                      request: ForgetPasswordRequestEntity(
                        email: widget.email,
                      ),
                    ),
                  );
                },
              )
            ]),
      ),
    );
  }
}
