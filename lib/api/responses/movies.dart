import 'package:moviedb/data/genres.dart';
import 'package:moviedb/data/movie.dart';
import 'package:moviedb/utils/json_utils.dart';

class MoviesResponse {
  static Movie itemFromJson(Map<String, dynamic>? json) {
    if (json == null) return Movie();

    var m = Movie();

    m.backdrop = JsonUtils.getString(json['backdrop_path'], m.backdrop);
    m.id = JsonUtils.getInt(json['id'], m.id);
    m.description = JsonUtils.getString(json['overview'], m.description);
    m.rating = JsonUtils.getDouble(json['vote_average'], m.rating);
    m.title = JsonUtils.getString(json['title'], m.title);

    var genreIds = json['genre_ids'];

    if (genreIds is List<int>) {
      for (var genreId in genreIds) {
        var genre = Genres.getById(genreId);

        if (genre != null) m.genres.add(genre);
      }
    }

    return m;
  }

  static List<Movie> fromJson(Map<String, dynamic>? json) {
    if (json == null) return [];

    List<Movie> list = [];

    var moviesJson = json['results'];

    if (moviesJson is List) {
      list = moviesJson.map((item) => itemFromJson(item)).toList();
    }

    return list;
  }
}
