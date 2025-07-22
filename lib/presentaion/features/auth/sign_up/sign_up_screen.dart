import 'package:exam_app/core/colors_manager.dart';
import 'package:exam_app/core/routes_manager.dart';
import 'package:exam_app/core/strings_manager.dart';
import 'package:exam_app/presentaion/features/auth/sign_up/sign_up_states.dart';
import 'package:exam_app/presentaion/features/auth/sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/model/request/sign_up_request.dart';
import '../../../../core/app_style.dart';
import '../../../../di/di.dart';

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
  final TextEditingController confirmPasswordController = TextEditingController();
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
      create: (BuildContext context) =>getIt<SignUpViewModel>(),
      child: Scaffold(
       appBar: AppBar(leading: BackButton(), title: Text(StringsManager.signUpWord)),
       body: BlocListener<SignUpViewModel,SignUpStates>(

         listener: (BuildContext context, state) {
           switch(state){
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
               Navigator.pushReplacementNamed(context, RoutesManager.logIn);
             case SignUpFailure():
               Navigator.pop(context);
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text(StringsManager.error, style: AppStyle.snackBarMessage),
                   backgroundColor: Colors.red,
                   duration: Duration(seconds: 2),
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
                       labelText:StringsManager.userName,
                       hintText: StringsManager.enterYourUserName,
                       border: OutlineInputBorder(),
                     ),
                     validator: (text) {
                       if (text == null || text.trim().isEmpty) {
                         return StringsManager.thisUserNotValid;
                       }

                       return null;
                     },
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
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return StringsManager.pleaseEnterYourFirstName;
                             }
                           },
                         ),
                       ),
                       SizedBox(width: 20),
                       Expanded(
                         child: TextFormField(
                           controller: lastNameController,
                           decoration: InputDecoration(
                             labelText:StringsManager.lastName ,
                             hintText: StringsManager.enterLastName,
                             border: OutlineInputBorder(),
                           ),
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return StringsManager.pleaseEnterYourLastName;
                             }
                           },
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 25),

                   TextFormField(
                     controller: emailController,
                     decoration: InputDecoration(
                       labelText:  StringsManager.email,
                       hintText: StringsManager.enterYourEmail,
                       border: OutlineInputBorder(),
                     ),
                     validator: (text) {
                       if (text == null || text.trim().isEmpty) {
                         return StringsManager.thisEmailIsNitValid;
                       }
                       bool isEmailValid = RegExp(
                         StringsManager.emailRegsExp,
                       ).hasMatch(text);
                       if (!isEmailValid) {
                         return StringsManager.emailFormatIsWrong;
                       }
                       return null;
                     },
                   ),
                   SizedBox(height: 25),

                   Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           controller: passwordController,
                           decoration: InputDecoration(
                             labelText: StringsManager.passwordWord,
                             hintText: StringsManager.enterPassword,
                             border: OutlineInputBorder(),
                           ),
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return StringsManager.pleaseEnterYourPassword;
                             }
                             if (text.length < 6) {
                               return StringsManager.passwordShouldBeMore;
                             }
                           },
                         ),
                       ),
                       SizedBox(width: 20),

                       Expanded(
                         child: TextFormField(
                           controller: confirmPasswordController,
                           decoration: InputDecoration(
                             labelText:StringsManager.confirmPassword,
                             hintText: StringsManager.enterConfirmPassword,
                             border: OutlineInputBorder(),
                           ),
                           validator: (text) {
                             if (text == null || text.isEmpty) {
                               return  StringsManager.pleaseEnterAPassword;
                             }
                             if (text != passwordController.text) {
                               return StringsManager.passwordNotMatched;
                             }
                           },
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
                     validator: (text) {
                       if (text == null || text.isEmpty) {
                         return  StringsManager.enterPhoneNumber;
                       }

                       if (text != phoneController.text) {
                         return StringsManager.phoneNumberNotMatched;
                       }

                       }

                   ),

                   SizedBox(height: 75),

                   ElevatedButton(
                     onPressed: () {
                       if (_formKey.currentState!.validate()) {
                         final request = SignUpRequest(
                           username: userNameController.text,
                           firstName: firstNameController.text,
                           lastName: lastNameController.text,
                           email: emailController.text,
                           password: passwordController.text,
                           rePassword: confirmPasswordController.text,
                           phone: phoneController.text,
                         );
                         context.read<SignUpViewModel>().signUp(request);
                         Navigator.pushNamed(context, RoutesManager.logIn);
                       }


                     },
                     child: Container(
                       width: double.infinity,
                       height: 50,
                       decoration: BoxDecoration(
                         color: Colors.blue[900],
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: Center(
                         child: Text(
                           StringsManager.signUpWord,
                           style: TextStyle(color: Colors.white),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(height: 15),

                   Row(
                     children: [
                        Center(child: Text(StringsManager.alreadyHaveAnAccount)),
                       GestureDetector(
                         onTap: (){
                           Navigator.pushNamed(context,RoutesManager.logIn);
                         },
                         child:Text(StringsManager.logInWord
                           ,style: TextStyle(color: ColorsManager.blueButton,decoration: TextDecoration.underline),  ),
                       )
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
            ),
    );
  }
}
