import 'package:axis_assignment/config/constants/assets_const.dart';
import 'package:axis_assignment/config/constants/routes_const.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  Future<void> _delay(BuildContext ctx) async {
    // splash timer
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    Navigator.pushReplacementNamed(ctx, homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _delay(context),
      builder: (context, snapshot) => const Scaffold(
        body: AppLogo(
          width: 164,
          height: 164,
          imageAsset: appLogoAsset,
        ),
      ),
    );
  }
}
