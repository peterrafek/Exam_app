import 'package:exam_app/presentation/widgets/login/build_login_form.dart';
import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/di.dart';
import '../../../../core/strings_manager.dart';
import '../../../viewmodel/cubits/log_in_cubit.dart';
import '../../../viewmodel/states/login_state.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late final LogInCubit logInCubit;

  @override
  void initState() {
    logInCubit = getIt<LogInCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.logInWord),
        ),
        body: BlocListener<LogInCubit, LoginState>(
          bloc: logInCubit,
          listener: (context, state) {
            switch (state) {
              case LoginStateInitialState():
                break;
              case LoginStateLoadingState():
                showLoadingDialog(context, color: ColorsManager.blueButton);
              case LoginStateSuccessState():
                Navigator.pop(context);
                showAppSnackBar(
                    context, StringsManager.loginSuccessfully, Colors.green);
              case LoginStateErrorState():
                Navigator.pop(context);
                showAppSnackBar(context, StringsManager.error, Colors.red);
            }
          },
          child: BuildLoginForm(logInCubit: logInCubit),
        ),
      ),
    );
  }
}
