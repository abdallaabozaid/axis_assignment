import 'package:axis_assignment/config/constants/routes_const.dart';
import 'package:axis_assignment/src/presentation/01_splash_screen/splash_screen.dart';
import 'package:axis_assignment/src/presentation/02_on_boarding_screen/onboarding_screen.dart';
import 'package:axis_assignment/src/presentation/03_home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }

    return null;
  }
}
