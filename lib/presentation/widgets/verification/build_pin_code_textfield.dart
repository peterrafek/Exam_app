import 'package:exam_app/presentation/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BuildPinCodeTextfield extends StatefulWidget {
  final void Function(String code) onCompleted;
  final void Function(String code) onSubmitted;

  BuildPinCodeTextfield({
    super.key,
    required this.onCompleted,
    required this.onSubmitted,
  });

  @override
  State<BuildPinCodeTextfield> createState() => _BuildPinCodeTextfieldState();
}

class _BuildPinCodeTextfieldState extends State<BuildPinCodeTextfield> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: _controller,
      length: 6,
      appContext: context,
      animationType: AnimationType.scale,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
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
      onSubmitted: (value) {
        if (value.isEmpty || value.length < 6) {
          showAppSnackBar(
              context, 'Please enter the 6-digit code.', Colors.red);
          return;
        }
        if (value.length == 6) {
          widget.onSubmitted(value);
        }
      },
      onCompleted: (value) {
        if (value.length == 6) {
          widget.onCompleted(value);
        }
      },
    );
  }
}
