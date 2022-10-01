import 'package:axis_assignment/src/application/01_celeberities/all_celeberities/all_celeberities_bloc.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/app_loader.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/common_app_bar.dart';
import 'package:axis_assignment/src/presentation/03_home_screen/widgets/celeberities_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
        child: const CommonAppBar(title: 'Celeberity'),
      ),
      body: BlocBuilder<AllCeleberitiesBloc, AllCeleberitiesState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.isLoading && state.failureOrSuccessOption == none())
                const AppLoader(),
              Expanded(
                child: BlocBuilder<AllCeleberitiesBloc, AllCeleberitiesState>(
                  builder: (context, state) {
                    return state.failureOrSuccessOption.fold(
                        () => Container(),
                        (a) => a.fold(
                            (l) => Container(),
                            (r) =>
                                CelebertitiesBuilder(celebs: r.celeberities)));
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
