import 'package:moviedb/api/api_requests.dart';
import 'package:moviedb/api/responses/genres.dart';
import 'package:moviedb/data/genres.dart';
import 'package:moviedb/db_storage/genres.dart';

class MovieService {
  static Future<void> fetchGenres() async {
    var response = await ApiRequests.movie.dio.get('genre/movie/list');

    if (response.statusCode == 200) {
      var genres = GenresResponse.fromJson(response.data);

      // add genres and store to db
      Genres.addAll(genres);
      await GenresDbStorage.store();
      return;
    }

    // try to load genres from db if we fail to load
    await GenresDbStorage.load();
  }
}
