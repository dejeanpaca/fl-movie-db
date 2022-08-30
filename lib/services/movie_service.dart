import 'package:moviedb/api/api_requests.dart';
import 'package:moviedb/api/responses/genres.dart';
import 'package:moviedb/data/genres.dart';

class MovieService {
  static Future<void> fetchGenres() async {
    var response = await ApiRequests.movie.dio.get('genre/movie/list');

    if (response.statusCode == 200) {
      var genres = GenresResponse.fromJson(response.data);

      Genres.addAll(genres);
    }
  }
}
