import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 100.h,
      title: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(18.r),
        ),
      ),
      leadingWidth: 50.w,
      backgroundColor: AppColors.appMainColor,
    );
  }
}
