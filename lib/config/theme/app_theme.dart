import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData lightAppTheme = ThemeData(
    // fontFamily: '',
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    fontFamily: 'Crete Round',
    scaffoldBackgroundColor: Colors.grey.shade100,
    elevatedButtonTheme: _elevatedBtnTheme(),
  );
  static ElevatedButtonThemeData _elevatedBtnTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w700),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(AppColors.appMainColor),
        elevation: MaterialStateProperty.all(0),
      ),
    );
  }
}
