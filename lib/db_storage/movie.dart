import 'package:moviedb/app.dart';
import 'package:moviedb/data/favourites.dart';
import 'package:moviedb/data/genres.dart';
import 'package:moviedb/data/movie.dart';

class FavouriteMovieDbStorage {
  /// store all genres to database
  static Future<void> store(Movie m) async {
    for (var m in Favourites.list.entries) {
      // insert movie
      Map<String, dynamic> row = m.value.toMap();

      await App.movieDb.db.insert('favourites', row);

      // remove any previous genres, if left over
      await App.movieDb.db.delete('movie_genres', where: 'movie = ?', whereArgs: [m.value.id]);

      // insert genres associated with the movie
      for (var g in m.value.genres) {
        Map<String, dynamic> row = {
          'movie': m.value.id,
          'genre': g.id,
        };

        await App.movieDb.db.insert('movie_genres', row);
      }
    }
  }

  /// load favourite movies from database
  static Future<void> load() async {
    List<Movie> movies = [];

    var result = await App.movieDb.db.rawQuery('SELECT * FROM favourites');

    for (var item in result) {
      var m = Movie(
        id: item['movie_id'] as int,
        title: item['title'] as String,
        rating: item['rating'] as double,
        description: item['description'] as String,
        backdrop: item['backdrop'] as String,
        poster: item['poster'] as String,
      );

      // load genres

      var genreResult = await App.movieDb.db.rawQuery('SELECT genre FROM movie_genres WHERE movie=${m.id}');

      for (var item in genreResult) {
        var genre = Genres.getById(item['genre'] as int);
        if (genre != null) m.genres.add(genre);
      }

      movies.add(m);
    }

    Favourites.addAll(movies);
  }

  /// remove a movie from db
  static Future<void> remove(int movieId) async {
    await App.movieDb.db.delete('favourites', where: 'movie_id = ?', whereArgs: [movieId]);
  }
}
