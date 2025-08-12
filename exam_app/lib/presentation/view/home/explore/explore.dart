import 'package:exam_app/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/home/list_of_subject.dart';
import '../../../widgets/home/search_bar.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBarr(),
        SizedBox(height: 20.h),
        Padding(
          padding: REdgeInsets.all(8.0),
          child: Text(
            'Browse by subject',
            style: AppStyle.forgetPasswordTitle,
          ),
        ),
        SizedBox(height: 10.h),
        Expanded(child: ListOfSubject()),
      ],
    );
  }
}
