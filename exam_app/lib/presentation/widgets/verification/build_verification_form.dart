import 'package:exam_app/domain/entities/forget_password/requests/forget_password/forget_password_request.dart';
import 'package:exam_app/domain/entities/verification/request/verify_requset.dart';
import 'package:exam_app/presentation/viewmodel/cubits/verification/verification_cubit.dart';
import 'package:exam_app/presentation/viewmodel/intents/forget_password/forget_password_intent.dart';
import 'package:exam_app/presentation/widgets/verification/pin_code_textfiled.dart';
import 'package:exam_app/presentation/widgets/verification/resend_code_row.dart';
import 'package:exam_app/presentation/widgets/verification/title_and_subtitle_of_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/strings_manager.dart';
import '../../viewmodel/cubits/forget_password/forget_password_cubit.dart';
import '../../viewmodel/intents/verification/verification_intent.dart';
import '../reusable_widgets.dart';

class BuildVerificationForm extends StatelessWidget {
  const BuildVerificationForm({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final verificationController = TextEditingController();

    return Padding(
      padding: REdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleAndSubtitleOfVerification(),
              SizedBox(height: 30.h),
              SizedBox(height: 50.h),
              PinCodeTextFiledWidget(
                  verificationController: verificationController,
                  onCompleted: (value) {
                    BlocProvider.of<VerificationCubit>(context).doIntent(
                      OnVerificationIntent(
                        request: VerifyRequsetEntity(
                            resetCode: verificationController.text),
                      ),
                    );
                  },
                  onSubmitted: (value) {
                    if (value.isEmpty || value.length < 6) {
                      showAppSnackBar(
                          context, StringsManager.enter6DigitCode, Colors.red);
                      return;
                    }
                    BlocProvider.of<VerificationCubit>(context).doIntent(
                      OnVerificationIntent(
                        request: VerifyRequsetEntity(resetCode: value),
                      ),
                    );
                  }),
              ResendCodeRow(onResend: () {
                BlocProvider.of<ForgetPasswordCubit>(context).doIntent(
                  OnConfirmEmailForgetPasswordClickIntent(
                    request: ForgetPasswordRequestEntity(
                      email: email,
                    ),
                  ),
                );
              }),
            ]),
      ),
    );
  }
}
