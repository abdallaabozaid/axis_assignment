import 'dart:convert';

import 'package:axis_assignment/src/domain/01_celeberities/celeberities_response.dart';
import 'package:axis_assignment/src/infrastructure/local/preferences.dart';

class CeleberitiesStorage {
  static final _storage = Storage.preferences;

  static const String _key = 'celeberities-data';
  static Future<void> saveData(Map<String, dynamic> jsonData) async {
    final String stringData = _convertToString(jsonData);
    await _storage.setString(_key, stringData);
  }

  static Future<Map<String, dynamic>?> getLocalData() async {
    final String? savedDataString = _storage.getString(_key);
    final Map<String, dynamic>? savedData = _convertToJson(savedDataString);

    return savedData;
  }

  static Future removaSavedData() async {
    _storage.remove(_key);
  }

  static String _convertToString(Map<String, dynamic> responseData) {
    return jsonEncode(responseData);
  }

  static Map<String, dynamic>? _convertToJson(String? responseData) {
    return responseData == null ? null : jsonDecode(responseData);
  }
}
