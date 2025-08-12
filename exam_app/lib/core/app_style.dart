 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';

class AppStyle {
  static TextStyle forgetPasswordTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    color: Colors.black,
  );
  static TextStyle snackBarMessage = GoogleFonts.inter(
    fontWeight: FontWeight.w700,
    fontSize: 18.sp,
    color: Colors.white,
  );
  static TextStyle forgetPasswordSubtitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: ColorsManager.hintGrey,
  );
  static TextStyle underButtonTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Colors.black,
  );
  static TextStyle appBarTitle = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
    color: Colors.black,
  );
  static TextStyle searchText = GoogleFonts.inter(
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    color: Colors.grey,
  );
  static TextStyle signUpWord = GoogleFonts.inter(
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: ColorsManager.blueButton,
  );static TextStyle blueButton = GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: Colors.white
  );
}
