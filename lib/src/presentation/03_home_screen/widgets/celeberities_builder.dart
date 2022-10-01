// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/src/application/01_celeberities/all_celeberities/all_celeberities_bloc.dart';
import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:axis_assignment/src/presentation/00_core/app_bloc_events.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/empty_builder.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/error_dialog.dart';
import 'package:flutter/material.dart';

import 'package:axis_assignment/src/domain/01_celeberities/celeberity_model.dart';
import 'package:axis_assignment/src/presentation/03_home_screen/widgets/celeb_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CelebertitiesBuilder extends StatefulWidget {
  const CelebertitiesBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<CelebertitiesBuilder> createState() => _CelebertitiesBuilderState();
}

class _CelebertitiesBuilderState extends State<CelebertitiesBuilder> {
  final ScrollController scrollcontroller = ScrollController();
  int pageIndex = 1;
  List<Celebrity> celebs = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCeleberitiesBloc, AllCeleberitiesState>(
      builder: (context, state) {
        state.failureOrSuccessOption.fold(
          () => null,
          (a) => a.fold(
            (l) => _showErrorDialog(l),
            (r) => celebs.addAll(r.celeberities),
          ),
        );
        return RefreshIndicator(
          onRefresh: () async {
            celebs.clear();
            AppBlocEvents.getAllCelebsData(context, pageIndex: 1);
          },
          child: !state.isLoading && celebs.isEmpty
              ? EmptyBuilder(
                  emptyLabel:
                      'Something went wrong , please check your internet connection and try again .',
                  onRefresh: () =>
                      AppBlocEvents.getAllCelebsData(context, pageIndex: 1),
                )
              : ListView.builder(
                  controller: scrollcontroller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  itemCount: celebs.length,
                  itemBuilder: (context, index) =>
                      CeleberityItem(celebrity: celebs[index]),
                ),
        );
      },
    );
  }

  @override
  void initState() {
    //added the pagination function with listener
    scrollcontroller.addListener(pagination);
    super.initState();
  }

  void pagination() {
    if ((scrollcontroller.position.pixels ==
            scrollcontroller.position.maxScrollExtent) &&
        (pageIndex < 500)) {
      pageIndex += 1;
      AppBlocEvents.getAllCelebsData(context, pageIndex: pageIndex);
    }
  }

  void _showErrorDialog(GetDataFailure failure) {
    showDialog(
      context: context,
      builder: (context) => GetDataErrorDialog(failure: failure),
    );
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }
}
