import 'package:exam_app/core/colors_manager.dart';
import 'package:exam_app/core/di.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/presentation/viewmodel/cubits/forget_password/forget_password_cubit.dart';
import 'package:exam_app/presentation/viewmodel/states/forget_password/forget_password_state.dart';
import 'package:exam_app/presentation/widgets/forget_password/build_forget_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/reusable_widgets.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  late final ForgetPasswordCubit forgetPasswordCubit;

  @override
  void initState() {
    // TODO: implement initState
    forgetPasswordCubit = getIt<ForgetPasswordCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        bloc: forgetPasswordCubit,
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
            // Navigator.pushReplacementNamed(
            //     context, RoutesManager.emailVerification,
            //     arguments: emailController.text);
            case ForgetPasswordErrorState():
              Navigator.pop(context);
              showAppSnackBar(context, StringsManager.error, Colors.red);
          }
        },
        child:
            BuildForgetPasswordForm(forgetPasswordCubit: forgetPasswordCubit),
      ),
    );
  }
}
