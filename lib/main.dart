import 'package:axis_assignment/src/infrastructure/local/preferences.dart';
import 'package:axis_assignment/src/infrastructure/remote/dio_helper.dart';
import 'package:axis_assignment/src/presentation/00_core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Storage.initializePreferences();
  DioHelper.setDioSettings();

  runApp(const AppWidget());
}
