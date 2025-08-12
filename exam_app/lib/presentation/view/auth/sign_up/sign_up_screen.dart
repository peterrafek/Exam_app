import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/domain/entities/sign_up/request/sign_up_request.dart';
import 'package:exam_app/presentation/viewmodel/cubits/sign_up/sign_up_view_model.dart';
import 'package:exam_app/presentation/viewmodel/states/sign_up/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_style.dart';
import '../../../../core/di.dart';
import '../../../widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<SignUpViewModel>(),
      child: Scaffold(
          appBar: AppBar(
              leading: BackButton(), title: Text(StringsManager.signUpWord)),
          body: Builder(builder: (context) {
            final viewModel = context.read<SignUpViewModel>();
            return BlocListener<SignUpViewModel, SignUpStates>(
              listener: (BuildContext context, state) {
                switch (state) {
                  case SignUpInitial():
                    break;
                  case SignUpLoading():
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  case SignUpSuccess():
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(StringsManager.signUpSuccessfullyTitle,
                            style: AppStyle.snackBarMessage),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pushReplacementNamed(
                        context, RoutesManager.logIn);
                  case SignUpFailure():
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message ?? StringsManager.error,
                            style: AppStyle.snackBarMessage),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 4),
                      ),
                    );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userNameController,
                          decoration: InputDecoration(
                            labelText: StringsManager.userName,
                            hintText: StringsManager.enterYourUserName,
                            border: OutlineInputBorder(),
                          ),
                          validator: viewModel.validateUserName,
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  labelText: StringsManager.firstName,
                                  hintText: StringsManager.enterFirstName,
                                  border: OutlineInputBorder(),
                                ),
                                validator: viewModel.validateFirstName,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                controller: lastNameController,
                                decoration: InputDecoration(
                                  labelText: StringsManager.lastName,
                                  hintText: StringsManager.enterLastName,
                                  border: OutlineInputBorder(),
                                ),
                                validator: viewModel.validateLastName,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: StringsManager.email,
                            hintText: StringsManager.enterYourEmail,
                            border: OutlineInputBorder(),
                          ),
                          validator: viewModel.validateEmail,
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: StringsManager.passwordWord,
                                  hintText: StringsManager.enterPassword,
                                  border: OutlineInputBorder(),
                                ),
                                validator: viewModel.validatePassword,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                obscureText: true,
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: StringsManager.confirmPassword,
                                  hintText: StringsManager.enterConfirmPassword,
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) =>
                                    viewModel.validateConfirmPassword(
                                        value, passwordController.text),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: StringsManager.phoneNumber,
                            hintText: StringsManager.enterPhoneNumber,
                            border: OutlineInputBorder(),
                          ),
                          validator: viewModel.validatePhone,
                        ),
                        SizedBox(height: 75),
                        BlueButton(
                          text: StringsManager.signUpWord,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final request = SignUpRequestEntity(
                                username: userNameController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                rePassword: confirmPasswordController.text,
                                phone: phoneController.text,
                              );
                              context.read<SignUpViewModel>().signUp(request);
                            }
                          },
                        ),
                        SizedBox(height: 10.h),
                        UnderButtonRow(
                          behindUnderLineText:
                              StringsManager.alreadyHaveAnAccount,
                          underLineText: StringsManager.logInWord,
                          onTapClick: () {
                            Navigator.pushNamed(context, RoutesManager.logIn);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
