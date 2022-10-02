// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/config/enums.dart';
import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/src/presentation/00_core/app_common_commands.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:axis_assignment/src/domain/01_celeberities/celeberity_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.profileImage,
  }) : super(key: key);
  final ProfileImage profileImage;
  @override
  Widget build(BuildContext context) {
    final String url = AppCommanCommands.getImageUrl(
        imagePath: profileImage.filePath, size: ProfileImageSize.originalSize);
    return SizedBox(
      width: profileImage.width.toDouble(),
      height: profileImage.height.toDouble(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            fit: BoxFit.scaleDown,
            imageUrl: url,
          ),
          Positioned(
            left: 10.w,
            top: 10.h,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            bottom: 10.h,
            child: GestureDetector(
              onTap: () async => _saveImage(context, url),
              child: const Icon(
                Icons.arrow_circle_down_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveImage(BuildContext ctx, String url) async {
    await GallerySaver.saveImage(url);

    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        content: Container(
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
            color: AppColors.appMainColor,
          ),
          child: const Text('Photo Saved to Gallery'),
        ),
      ),
    );
    Navigator.pop(ctx);
    // SnackBar(content: content);
  }
}
