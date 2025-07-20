import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_style.dart';
import '../../core/colors_manager.dart';

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
    builder: (context) =>
        AlertDialog(
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

  const UnderButtonRow({this.onTapClick,
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

  const EmailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter Your Email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }

        final emailRegex = RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        );

        if (!emailRegex.hasMatch(value)) {
          return 'Please enter a valid email';
        }

        return null;
      },
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter Your Password',
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }

        // At least 6 characters, 1 uppercase, 1 lowercase, 1 number, 1 special character
        final passwordRegex = RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$',
        );

        if (!passwordRegex.hasMatch(value)) {
          return 'Password must be at least 6 characters, include uppercase, lowercase, number, and symbol';
        }

        return null;
      },
    );
  }
}

class PasswordConfirmationTextField extends StatelessWidget {
  const PasswordConfirmationTextField(
      {super.key, required this.controller, required this.confirmController});

  final TextEditingController confirmController;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Enter Your Password',
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }

        // At least 6 characters, 1 uppercase, 1 lowercase, 1 number, 1 special character
        final passwordRegex = RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$',
        );

        if (!passwordRegex.hasMatch(value)) {
          return 'Password must be at least 6 characters, include uppercase, lowercase, number, and symbol';
        }
        if (value != confirmController.text) {
          return 'Passwords do not match';
        }

        return null;
      },
    );

  }
}
