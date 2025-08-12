import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';


class SearchBarr extends StatelessWidget {
  const SearchBarr({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Center(
      child: Padding(
        padding:  REdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(25.r),
          ),
          padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey, size: 24.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: TextField(
                  controller: searchController,
                  onSubmitted: (value) {
                    // Handle search here
                  },
                  cursorColor: Colors.grey,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isCollapsed: true,
                  ),
                  style: AppStyle.searchText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
