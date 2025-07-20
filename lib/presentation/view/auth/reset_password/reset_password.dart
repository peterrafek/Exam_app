import 'package:exam_app/presentation/widgets/reset_password/build_reset_password_form.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/routes_manager.dart';
import '../../../viewmodel/cubits/reset_password_cubit.dart';
import '../../../viewmodel/states/reset_password_state.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          print("ResetPassword - ResetPasswordCubit Listener: $state");
          switch (state) {
            case ResetPasswordInitialState():
              break;
            case ResetPasswordLoadingState():
              showLoadingDialog(context, color: ColorsManager.blueButton);
            case ResetPasswordSuccessState():
              Navigator.pop(context);
              showAppSnackBar(
                  context, "Password Reseted Successfully", Colors.green);
              Navigator.pushReplacementNamed(context, RoutesManager.logIn);
            case ResetPasswordErrorState():
              Navigator.pop(context);
              showAppSnackBar(context, 'Error', Colors.red);
          }
        },
        child: BuildResetPasswordForm(
          email: widget.email,
          resetPasswordCubit: context.read<ResetPasswordCubit>(),
        ),
      ),
    );
  }
}
