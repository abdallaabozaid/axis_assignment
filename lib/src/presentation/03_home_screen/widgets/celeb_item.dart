// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/config/constants/assets_const.dart';
import 'package:axis_assignment/config/constants/routes_const.dart';
import 'package:axis_assignment/config/enums.dart';
import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/src/presentation/00_core/app_common_commands.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/app_spacers.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/buttons/primary_button.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/buttons/secondary_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:axis_assignment/src/domain/01_celeberities/celeberity_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CeleberityItem extends StatelessWidget {
  const CeleberityItem({
    Key? key,
    required this.celebrity,
  }) : super(key: key);
  final Celebrity celebrity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, detailsScreen),
      child: Container(
        margin: EdgeInsets.all(15.h),
        padding: EdgeInsets.all(10.h),
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.r),
          color: Colors.white,
        ),
        child: Row(
          children: [
            _celebAvtar(),
            HorizontalSpacer(10.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      celebrity.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    VerticalSpacer(10.h),
                    Text(celebrity.popularity.toString()),
                  ],
                ),
              ),
            ),
            HorizontalSpacer(10.w),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    onPressed: () {},
                    label: const Text('details'),
                    width: 80.w,
                    height: 36.h,
                  ),
                  SecondaryButton(
                    onPressed: () {},
                    label: const Text('known'),
                    width: 80.w,
                    height: 36.h,
                  )
                ],
              ),
            ),
            HorizontalSpacer(16.w),
          ],
        ),
      ),
    );
  }

  Widget _celebAvtar() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.appMainYellow,
          )),
      child: ClipOval(
        child: CachedNetworkImage(
            width: 90.w,
            height: 90.w,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => _defaultAvatarImage(),
            placeholder: (context, url) => _defaultAvatarImage(),
            imageUrl: AppCommanCommands.getImageUrl(
              imagePath: celebrity.profilePath,
              size: ProfileImageSize.medium,
            )),
      ),
    );
  }

  Widget _defaultAvatarImage() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        defaultAvatarAsset,
        width: 40.w,
        height: 40.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
