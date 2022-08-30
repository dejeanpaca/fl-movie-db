import 'dart:async';

import 'package:dio/dio.dart';

/// standard dio interceptors
class DioInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onError(DioError err, ErrorInterceptorHandler handler) {
    print('dio error: ${err.message}');
    handler.reject(err);
  }
}
