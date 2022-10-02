import 'package:axis_assignment/src/application/01_celeberities/all_celeberities/all_celeberities_bloc.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/app_loader.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/common_app_bar.dart';
import 'package:axis_assignment/src/presentation/03_home_screen/widgets/celeberities_builder.dart';
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
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  const Expanded(
                    child: CelebertitiesBuilder(),
                  ),
                  if (state.isLoading)
                    Container(
                      margin: EdgeInsets.all(12.w),
                      width: 20.w,
                      height: 20.w,
                      child: const CircularProgressIndicator(),
                    )
                ],
              ),
              if (state.isLoading) const AppLoader(),
            ],
          );
        },
      ),
    );
  }
}
