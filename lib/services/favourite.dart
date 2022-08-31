import 'package:moviedb/data/movie.dart';

class FavouriteService {
  static Future<void> toggle(Movie m) async {
    m.favourite = !m.favourite;
  }
}
