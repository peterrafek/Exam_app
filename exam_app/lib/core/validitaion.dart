import 'package:flutter/cupertino.dart';

class Validitaion {
  static final RegExp _emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$',
  );

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!_emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (!_passwordRegex.hasMatch(value)) {
      return 'Password must be at least 6 characters, include uppercase, lowercase, number, and symbol';
    }
    return null;
  }
  static String? validateConfirmPassword({
    required String? value,
    required TextEditingController originalPasswordController,
  }) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (!_passwordRegex.hasMatch(value)) {
      return 'Password must be at least 6 characters, include uppercase, lowercase, number, and symbol';
    }

    if (value != originalPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
