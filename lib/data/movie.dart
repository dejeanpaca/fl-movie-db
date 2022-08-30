import 'genres.dart';

class Movie {
  /// id of the movie, according to IMDB
  int id = 0;

  /// title
  String title = '';

  /// rating out of 10
  double rating = 0.0;

  /// list of genres
  List<Genre> genres = [];

  /// have we marked this movie as favorite
  bool favorite = false;

  /// description
  String description = '';

  /// backdrop image
  String backdrop = '';
}
