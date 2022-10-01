import 'package:axis_assignment/config/constants/routes_const.dart';
import 'package:axis_assignment/src/application/01_celeberities/one_celeberity_details/one_celeberity_bloc.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberity_model.dart';
import 'package:axis_assignment/src/infrastructure/remote/01_celeberities/celebereties_api.dart';
import 'package:axis_assignment/src/infrastructure/remote/01_celeberities/celeberities_repo.dart';
import 'package:axis_assignment/src/presentation/01_splash_screen/splash_screen.dart';
import 'package:axis_assignment/src/presentation/02_on_boarding_screen/onboarding_screen.dart';
import 'package:axis_assignment/src/presentation/03_home_screen/home_screen.dart';
import 'package:axis_assignment/src/presentation/04_details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

      case detailsScreen:
        final Celebrity celebrity = settings.arguments as Celebrity;
        return MaterialPageRoute(
          builder: (context) => BlocProvider<OneCeleberityBloc>(
            create: (context) =>
                OneCeleberityBloc(CeleberitiesRepo(CeleberitiesApi()))
                  ..add(GetCeleberityDetailsAndImagesEvent(id: celebrity.id)),
            child: DetailsScreen(celebrity: celebrity),
          ),
        );
    }

    return null;
  }
}
