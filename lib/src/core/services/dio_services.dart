import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioServices {
  static Dio dio = Dio();

  static Future<Response> get(String url) async {
    debugPrint('url: $url');
    try {
      Response response = await dio.get(url);
      return response;
    } on DioError catch (e) {
      debugPrint('Dio error: ${e.message}');
      return e.response!;
    }
  }
}
