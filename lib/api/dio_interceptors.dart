import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// standard dio interceptors
class DioInterceptors extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) print('req > ${response.requestOptions.uri} : Response: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('req > ${err.requestOptions.uri} : error: ${err.message}');
    super.onError(err, handler);
  }
}
