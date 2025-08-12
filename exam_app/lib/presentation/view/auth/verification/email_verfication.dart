import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/domain/entities/forget_password/requests/forget_password/forget_password_request.dart';
import 'package:exam_app/presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart';
import 'package:exam_app/presentation/viewmodel/cubits/verification/verification_cubit.dart';
import 'package:exam_app/presentation/viewmodel/states/forget_password/forget_password_state.dart';
import 'package:exam_app/presentation/viewmodel/states/verification/verification_state.dart';
import 'package:exam_app/presentation/widgets/verification/build_verification_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors_manager.dart';
import '../../../viewmodel/intents/forget_password/forget_password_intent.dart';
import '../../../widgets/reusable_widgets.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key, required this.email});

  final String email;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final formKey = GlobalKey<FormState>();
  final verificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: MultiBlocListener(listeners: [
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            switch (state) {
              case ForgetPasswordInitialState():
                break;
              case ForgetPasswordLoadingState():
                showLoadingDialog(context, color: ColorsManager.blueButton);
              case ForgetPasswordSuccessState():
                Navigator.pop(context);
                showAppSnackBar(
                    context, StringsManager.otpSentSuccessfully, Colors.green);
                verificationController.clear();
                setState(() {});
              case ForgetPasswordErrorState():
                Navigator.pop(context);
                showAppSnackBar(context, StringsManager.error, Colors.red);
            }
          },
        ),
        BlocListener<VerificationCubit, VerificationState>(
          listener: (context, state) {
            switch (state) {
              case VerificationInitialState():
                break;
              case VerificationLoadingState():
                showLoadingDialog(context, color: ColorsManager.blueButton);
              case VerificationSuccessState():
                Navigator.pop(context);
                showAppSnackBar(
                    context, StringsManager.verificationSuccess, Colors.green);
                Navigator.pushReplacementNamed(context, RoutesManager.resetPassword,
                    arguments: widget.email);
              case VerificationErrorState():
                Navigator.pop(context);
                final parentContext = context; // Capture the parent context
                showDialog(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: Text('Verification Failed'),
                    content: Text('Do you want to resend the code?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          verificationController.clear();
                          BlocProvider.of<ForgetPasswordCubit>(parentContext)
                              .doIntent(
                            OnConfirmEmailForgetPasswordClickIntent(
                              request: ForgetPasswordRequestEntity(
                                email: widget.email,
                              ),
                            ),
                          );
                        },
                        child: Text('OK'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                        },
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ], child: BuildVerificationForm(email: widget.email)),
    );
  }
}
