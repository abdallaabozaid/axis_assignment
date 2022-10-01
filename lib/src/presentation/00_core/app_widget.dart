import 'package:axis_assignment/config/router/app_router.dart';
import 'package:axis_assignment/config/theme/app_theme.dart';
import 'package:axis_assignment/src/application/01_celeberities/all_celeberities/all_celeberities_bloc.dart';
import 'package:axis_assignment/src/infrastructure/remote/01_celeberities/celebereties_api.dart';
import 'package:axis_assignment/src/infrastructure/remote/01_celeberities/celeberities_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<AllCeleberitiesBloc>(
            create: (ctx) => AllCeleberitiesBloc(
              CeleberitiesRepo(
                CeleberitiesApi(),
              ),
            )..add(
                const GetAllCeleberitiesEvent(pageIndex: 1),
              ),
          ),
        ],
        child: child!,
      ),
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Axis Celebrities',
        theme: AppTheme.lightAppTheme,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
