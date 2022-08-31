import 'dart:collection';
import 'movie.dart';

class Favourites {
  static Map<int, Movie> list = HashMap();

  static void add(Movie m) {
    list.addAll({m.id: m});
  }

  static void remove(Movie m) {
    list.remove(m.id);
  }

  static Movie? getById(int id) {
    return list[id];
  }

  static void addAll(List<Movie> movies) {
    for (var m in movies) {
      add(m);
    }
  }

  static void clear() {
    list.clear();
  }
}
