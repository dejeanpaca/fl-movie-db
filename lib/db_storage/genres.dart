import 'package:moviedb/app.dart';
import 'package:moviedb/data/genres.dart';

class GenresDbStorage {
  /// store all genres to database
  static Future<void> store() async {
    // clear existing genres
    App.movieDb.execute('DELETE FROM genres');
    App.movieDb.execute('VACUUM');

    for (var g in Genres.list.entries) {
      Map<String, dynamic> row = {
        'genre_id': g.value.id,
        'name': g.value.name,
      };

      await App.movieDb.db.insert('genres', row);
    }
  }

  /// load genres from database
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
}
