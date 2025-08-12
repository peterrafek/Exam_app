import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../core/strings_manager.dart';

class  ResetPasswordTitleAndSubTitle extends StatelessWidget {
  const  ResetPasswordTitleAndSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringsManager.resetPasswordTitle,
          style: AppStyle.forgetPasswordTitle,
        ),
        SizedBox(height: 15.h),
        Text(
          textAlign: TextAlign.center,
          StringsManager.resetPasswordSubTitle,
          style: AppStyle.forgetPasswordSubtitle,
        ),
      ],
    );
  }
}
