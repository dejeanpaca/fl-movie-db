import 'package:moviedb/app.dart';
import 'package:moviedb/data/genres.dart';
import 'package:moviedb/data/movie.dart';

class FavouriteMovieDbStorage {
  /// store all genres to database
  static Future<void> store(Movie m) async {
    for (var g in Genres.list.entries) {
      Map<String, dynamic> row = {
        'genre_id': g.value.id,
        'name': g.value.name,
      };

      await App.movieDb.db.insert('movies', row);
    }
  }

  /// load favourite movies from database
  static Future<void> load() async {
    Genres.clear();

    var result = await App.movieDb.db.rawQuery('SELECT genre_id, name FROM genres');

    for (var item in result) {
      var g = Genre();
      g.id = item['genre_id'] as int;
      g.name = item['name'] as String;
      Genres.add(g);
    }
  }

  /// remove a movie from db
  static Future<void> remove(int movieId) async {
    await App.movieDb.execute('DELETE FROM favourites WHERE movie_id = $movieId');
  }
}
