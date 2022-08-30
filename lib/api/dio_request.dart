import 'package:dio/dio.dart';
import 'package:moviedb/api/dio_interceptors.dart';

class DioRequests {
  /// dio instance for these kind of requests
  late Dio dio;

  /// api location
  String apiLocation = '';

  /// setup dio to work
  void initialize({required String location, DioInterceptors? interceptors}) {
    apiLocation = location;

    dio = Dio();
    dio.options.baseUrl = location;
    dio.interceptors.add(interceptors ?? DioInterceptors());
  }
}
