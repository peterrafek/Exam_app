import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam_app/domain/entities/subjects/subjects_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key, required this.item});

  final SubjectEntity item;

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
          child: Row(
            children: [
              CachedNetworkImage(
                height: 100.h,
                width: 100.w,
                imageUrl: item.icon ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  item.name ?? '',
                  style: AppStyle.underButtonTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
