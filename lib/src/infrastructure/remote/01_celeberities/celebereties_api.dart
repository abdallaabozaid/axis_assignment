import 'package:axis_assignment/config/constants/api_const.dart';
import 'package:axis_assignment/src/infrastructure/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CeleberitiesApi {
  final Dio dio = DioHelper.dio;

  Future<Map<String, dynamic>?> getAllCeleberities({
    required int pageIndex,
  }) async {
    try {
      final Response response = await dio.get(
        popularEndPoint,
        queryParameters: {'api_key': apiKey, 'page': pageIndex},
      );

      print(response.data);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("get all popular people API error : ${e.toString()}");
      }
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCeleberityDetails({
    required String id,
  }) async {
    try {
      final Response response = await dio.get(
        id,
        queryParameters: {'api_key': apiKey},
      );
      print(response.data);

      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("get one Celeberity details API error : ${e.toString()}");
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getCeleberityImages({
    required String id,
  }) async {
    try {
      final Response response = await dio.get(
        id + '/' + imagesEndPoint,
        queryParameters: {'api_key': apiKey},
      );
      print(response.data);

      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print("get one Celeberity details API error : ${e.toString()}");
      }
      rethrow;
    }
  }
}
