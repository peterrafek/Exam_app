import 'package:exam_app/core/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_style.dart';
import '../../core/colors_manager.dart';
import '../../core/validitaion.dart';

void showAppSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppStyle.snackBarMessage,
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    ),
  );
}

void showLoadingDialog(BuildContext context, {Color color = Colors.white}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(
        child: CircularProgressIndicator(color: color),
      ),
    ),
  );
}

class BlueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BlueButton({required this.onPressed, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyle.blueButton,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.blueButton,
        minimumSize: const Size(340, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100.r),
          ),
        ),
      ),
    );
  }
}

class UnderButtonRow extends StatelessWidget {
  final VoidCallback? onTapClick;
  final String behindUnderLineText;
  final String underLineText;

  const UnderButtonRow(
      {this.onTapClick,
      super.key,
      required this.behindUnderLineText,
      required this.underLineText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          behindUnderLineText,
          style:
              AppStyle.underButtonTitle.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 4.w),
        InkWell(
          onTap: onTapClick,
          child: Text(
            underLineText,
            style: AppStyle.signUpWord,
          ),
        ),
      ],
    );
  }
}

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  @override
  void dispose() {
    controller.dispose();
  }

  const EmailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        labelText: StringsManager.emailWord,
        hintText: StringsManager.emailHintText,
      ),
      keyboardType: TextInputType.emailAddress,
      validator:(value)=> Validitaion.validateEmail(controller.text),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        labelText: StringsManager.passwordWord,
        hintText: StringsManager.passwordHintText,
      ),
      obscureText: true,
      validator:(value)=> Validitaion.validatePassword(controller.text),
    );
  }
}

class PasswordConfirmationTextField extends StatelessWidget {
  const PasswordConfirmationTextField(
      {super.key, required this.controller, required this.confirmController});

  final TextEditingController confirmController;
  final TextEditingController controller;

  @override
  void dispose() {
    controller.dispose();
    confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        labelText: StringsManager.confirmPassword,
        hintText: StringsManager.passwordHintText,
      ),
      obscureText: true,
      validator: (value) => Validitaion.validateConfirmPassword(
          value: value, originalPasswordController: confirmController),
    );
  }
}
