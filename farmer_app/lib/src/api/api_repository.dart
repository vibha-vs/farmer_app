import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRepository {
  final String url;
  final Map payload;

  ApiRepository({required this.url, required this.payload});

  Dio _dio = Dio();

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    _dio.get(this.url, queryParameters: {}).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
