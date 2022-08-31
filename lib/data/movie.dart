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
  bool favourite = false;

  /// description
  String description = '';

  /// backdrop image
  String backdrop = '';

  /// poster image
  String poster = '';

  Movie({
    this.id = 0,
    this.title = '',
    this.rating = 0,
    this.favourite = false,
    this.description = '',
    this.backdrop = '',
    this.poster = '',
  });

  Map<String, dynamic> toMap() => {
        'movie_id': id,
        'title': title,
        'rating': rating,
        'backdrop': backdrop,
        'poster': poster,
        'description': description,
      };
}
