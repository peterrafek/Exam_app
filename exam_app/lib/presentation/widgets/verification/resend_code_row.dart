import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../core/colors_manager.dart';

class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({super.key, required this.onResend});

  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Didn\'t receive code?',
          style: AppStyle.underButtonTitle,
        ),
        SizedBox(
          width: 4.w,
        ),
        InkWell(
          onTap: onResend,
          child: Text('Resend',
              style: AppStyle.underButtonTitle.copyWith(
                  color: ColorsManager.blueButton,
                  decoration: TextDecoration.underline)),
        )
      ],
    );
  }
}
