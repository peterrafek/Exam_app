
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_style.dart';
import '../../core/colors_manager.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white, titleTextStyle: AppStyle.appBarTitle),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: stableBorder(),
      focusedBorder: stableBorder(),
      enabledBorder: stableBorder(),
      labelStyle: TextStyle(
          color: ColorsManager.borderGrey, fontWeight: FontWeight.w400),
      hintStyle: TextStyle(color: ColorsManager.hintGrey),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.blueButton,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Color(0xFFEDEFF3),
    ),
  );

  static OutlineInputBorder stableBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorsManager.borderGrey,
      ),
      borderRadius: BorderRadius.circular(8.r),
    );
  }
}
