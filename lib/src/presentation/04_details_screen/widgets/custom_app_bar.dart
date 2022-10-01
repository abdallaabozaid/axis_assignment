import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/src/presentation/04_details_screen/widgets/header_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {Key? key, required this.mainImage, required this.name})
      : super(key: key);
  final String mainImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      flexibleSpace: HeaderImage(mainImageUrl: mainImage),
      expandedHeight: 300,
      collapsedHeight: 30,
      toolbarHeight: 30,
      iconTheme: const IconThemeData(color: AppColors.appMainColor, size: 30),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 30.sp,
            fontFamily: 'Crete Round',
            color: AppColors.appMainColor,
          ),
        ),
      ),
    );
  }
}
