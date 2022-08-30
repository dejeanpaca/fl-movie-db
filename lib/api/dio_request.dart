import 'package:dio/dio.dart' as dio;
import 'package:moviedb/api/dio_interceptors.dart';

class DioRequests {
  /// dio instance for these kind of requests
  late dio.Dio dioInstance;

  /// api location
  String apiLocation = '';

  /// setup dio to work
  void initialize({required String location, DioInterceptors? interceptors}) {
    apiLocation = location;

    dioInstance == dio.Dio();
    dioInstance.options.baseUrl = location;
    dioInstance.interceptors.add(interceptors ?? DioInterceptors());
  }
}
