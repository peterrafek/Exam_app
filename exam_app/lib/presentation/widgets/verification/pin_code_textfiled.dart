import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeTextFiledWidget extends StatelessWidget {
  const PinCodeTextFiledWidget(
      {super.key,
      required this.verificationController,
      required this.onCompleted,
      required this.onSubmitted});

  final TextEditingController verificationController;
  final ValueChanged onCompleted;
  final ValueChanged onSubmitted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: verificationController,
      length: 6,
      appContext: context,
      animationType: AnimationType.scale,
      enableActiveFill: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        activeFillColor: Color(0xFFDFE6F7),
        selectedFillColor: Color(0xFFDFE7F7),
        inactiveFillColor: Color(0xFFDFE7F7),
        inactiveColor: Colors.transparent,
        selectedColor: Colors.transparent,
        activeColor: Colors.transparent,
        borderWidth: 0,
      ),
      onCompleted: (value) => onCompleted(value),
      onSubmitted: (value) => onSubmitted(value),
    );
  }
}
