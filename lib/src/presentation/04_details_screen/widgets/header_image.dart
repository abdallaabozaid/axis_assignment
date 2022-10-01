import 'package:axis_assignment/config/constants/assets_const.dart';
import 'package:axis_assignment/config/enums.dart';
import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/src/presentation/00_core/app_common_commands.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key, required this.mainImageUrl}) : super(key: key);
  final String mainImageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: 420,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CachedNetworkImage(
                placeholderFadeInDuration: const Duration(seconds: 0),
                imageUrl: AppCommanCommands.getImageUrl(
                  imagePath: mainImageUrl,
                  size: ProfileImageSize.originalSize,
                ),
                width: MediaQuery.of(context).size.width,
                height: 420,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: const CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Image(
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  image: AssetImage(defaultAvatarAsset),
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [AppColors.scaffoldBackG, Colors.transparent],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
