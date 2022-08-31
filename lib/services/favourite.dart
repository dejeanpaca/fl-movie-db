import 'package:moviedb/data/favourites.dart';
import 'package:moviedb/data/movie.dart';
import 'package:moviedb/db_storage/movie.dart';

class FavouriteService {
  /// add a movie to the favourites list
  static Future<void> add(Movie m) async {
    m.favourite = true;
    Favourites.add(m);
    FavouriteMovieDbStorage.store(m);
  }

  /// add a movie from the favourites list
  static Future<void> remove(Movie m) async {
    m.favourite = false;
    Favourites.remove(m);
    FavouriteMovieDbStorage.remove(m.id);
  }

  /// toggle the favourite state of a movie
  static Future<void> toggle(Movie m) async {
    if (m.favourite) {
      await remove(m);
    } else {
      await add(m);
    }
  }
}
