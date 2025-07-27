import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeAndForgetPasswordRow extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onCheckedChanged;
  final VoidCallback onForgetPassword;

  const RememberMeAndForgetPasswordRow({
    required this.isChecked,
    required this.onCheckedChanged,
    required this.onForgetPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onCheckedChanged,
        ),
        SizedBox(width: 4.w),
        Text('Remember Me'),
        Spacer(),
        InkWell(
          onTap: onForgetPassword,
          child: Text(
            'Forget password?',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
