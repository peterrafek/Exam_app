import 'package:exam_app/domain/entities/forget_password/request/forget_password_request_entity.dart';
import 'package:exam_app/presentation/viewmodel/cubits/verification_cubit.dart';
import 'package:exam_app/presentation/viewmodel/intents/forget_password_intent.dart';
import 'package:exam_app/presentation/viewmodel/states/verification_state.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:exam_app/presentation/widgets/verification/build_email_verification_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/routes_manager.dart';
import '../../../viewmodel/cubits/forget_password_cubit.dart';
import '../../../viewmodel/states/forget_password_state.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key, required this.email});

  final String email;

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final verificationController = TextEditingController();

  @override
  void dispose() {
    verificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
            listenWhen: (context, state) =>
                state is ForgetPasswordLoadingState ||
                state is ForgetPasswordSuccessState ||
                state is ForgetPasswordErrorState ||
                state is ForgetPasswordInitialState,
            listener: (context, state) {
              switch (state) {
                case ForgetPasswordLoadingState():
                  showLoadingDialog(context, color: ColorsManager.blueButton);
                case ForgetPasswordSuccessState():
                  Navigator.of(context).pop();
                  showAppSnackBar(
                      context, "OTP resended successfully.", Colors.green);
                  verificationController.clear();
                  setState(() {});
                case ForgetPasswordErrorState():
                  Navigator.pop(context);
                  showAppSnackBar(context, 'Error', Colors.red);
                case ForgetPasswordInitialState():
                  break;
              }
            },
          ),
          BlocListener<VerificationCubit, VerificationState>(
            listener: (context, state) {
              print(
                  "EmailVerification - VerificationCubit Listener: $state"); // ... your existing switch
              switch (state) {
                case VerificationLoadingState():
                  showLoadingDialog(context, color: ColorsManager.blueButton);
                case VerificationSuccessState():
                  Navigator.of(context).pop();
                  showAppSnackBar(
                      context, "Verification successed.", Colors.green);
                  Navigator.pushNamed(
                      context, RoutesManager.resetPassword,
                      arguments: widget.email);
                case VerificationErrorState():
                  Navigator.of(context).pop();
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
                              OnEnterdEmailIntent(
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
                            verificationController.clear();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  );
                case VerificationInitialState():
                  break;
              }
            },
          ),
        ],
        child: BuildEmailVerificationForm(
          email: widget.email,
          verificationCubit: context.read<VerificationCubit>(),
        ),
      ),
    );
  }
}
