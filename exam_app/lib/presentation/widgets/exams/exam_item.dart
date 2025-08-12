import 'package:exam_app/core/app_style.dart';
import 'package:exam_app/core/assets_manager.dart';
import 'package:exam_app/core/colors_manager.dart';
import 'package:exam_app/domain/entities/exams/response/exams_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key, required this.item});

  final ExamEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: REdgeInsets.all(16.0),
          child: Row(children: [
            Image.asset(
              AssetsManager.examProfitLogo,
              width: 100.w,
              height: 100.h,
            ),
            SizedBox(width: 5.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title ?? '',
                  style: AppStyle.forgetPasswordTitle,
                ),
                SizedBox(height: 5.h),
                Text(
                  item.numberOfQuestions != null
                      ? '${item.numberOfQuestions} Question'
                      : '0 Questions',
                  style: AppStyle.searchText,
                ),
              ],
            ),
            Spacer(),
            Text(
              item.duration != null ? '${item.duration} Minutes' : '0 min',
              style:
                  AppStyle.searchText.copyWith(color: ColorsManager.blueButton),
            ),
          ]),
        ),
      ),
    );
  }
}
