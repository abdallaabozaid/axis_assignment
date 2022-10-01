import 'package:axis_assignment/config/router/app_router.dart';
import 'package:axis_assignment/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => child!,
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
