// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/config/constants/api_const.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  DioHelper();

  static setDioSettings() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        receiveDataWhenStatusError: true,
      ),
    );
  }
}
