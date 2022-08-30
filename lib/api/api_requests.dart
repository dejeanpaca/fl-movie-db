import 'package:moviedb/api/config.dart';
import 'package:moviedb/api/dio_request.dart';

class ApiRequests {
  static late DioRequests movie;
  static late DioRequests movieAuth;

  static Future<void> initialize() async {
    movie = DioRequests();

    movie.initialize(location: ApiConfig.apiEndpoint);
    movieAuth.initialize(location: ApiConfig.apiEndpoint);
  }
}
