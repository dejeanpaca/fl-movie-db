import 'package:dio/dio.dart';
import 'package:moviedb/api/config.dart';

import 'dio_interceptors.dart';

/// standard dio interceptors
class AuthInterceptors extends DioInterceptors {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${ApiConfig.authorization}';
  }
}
