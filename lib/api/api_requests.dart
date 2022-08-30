import 'package:moviedb/api/auth_interceptors.dart';
import 'package:moviedb/api/config.dart';
import 'package:moviedb/api/dio_request.dart';

class ApiRequests {
  static late DioRequests movie;

  static Future<void> initialize() async {
    movie = DioRequests();

    movie.initialize(location: ApiConfig.apiEndpoint, interceptors: AuthInterceptors());
  }
}
