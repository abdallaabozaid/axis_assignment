// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/config/enums.dart';
import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/src/application/01_celeberities/one_celeberity_details/one_celeberity_bloc.dart';
import 'package:axis_assignment/src/presentation/00_core/app_common_commands.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:axis_assignment/src/domain/01_celeberities/celeberity_images.dart';

class ImagesBuilder extends StatelessWidget {
  const ImagesBuilder({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OneCeleberityBloc, OneCeleberityState>(
        builder: (context, state) {
          return state.isLoading
              ? const SizedBox()
              : state.imagesFailureOrSuccessOption.fold(
                  () => const SizedBox(),
                  (a) => a.fold(
                    (l) => const SizedBox(),
                    (r) => SliverPadding(
                      padding: EdgeInsets.all(12.w),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return _imageItem(r.profiles[index]);
                          },
                          childCount: r.profiles.length,
                        ),
                      ),
                    ),
                  ),
                );
        },
      );

  Widget _imageItem(ProfileImage profileImage) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.appMainYellow,
            ),
            borderRadius: BorderRadius.circular(
              22.r,
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            22.r,
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: AppCommanCommands.getImageUrl(
              imagePath: profileImage.filePath,
              size: ProfileImageSize.originalSize,
            ),
            errorWidget: (context, url, error) => const SizedBox(),
          ),
        ),
      ),
    );
  }
}
