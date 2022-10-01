import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late SharedPreferences preferences;

  static Future<void> initializePreferences() async =>
      preferences = await SharedPreferences.getInstance();
}
