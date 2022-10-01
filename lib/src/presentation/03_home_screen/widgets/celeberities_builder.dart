// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/src/presentation/00_core/app_bloc_events.dart';
import 'package:flutter/material.dart';

import 'package:axis_assignment/src/domain/01_celeberities/celeberity_model.dart';
import 'package:axis_assignment/src/presentation/03_home_screen/widgets/celeb_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CelebertitiesBuilder extends StatelessWidget {
  const CelebertitiesBuilder({
    Key? key,
    required this.celebs,
  }) : super(key: key);
  final List<Celebrity> celebs;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async =>
          AppBlocEvents.getAllCelebsData(context, pageIndex: 1),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemCount: celebs.length,
        itemBuilder: (context, index) =>
            CeleberityItem(celebrity: celebs[index]),
      ),
    );
  }
}
