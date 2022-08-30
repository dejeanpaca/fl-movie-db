import 'dart:collection';

class Genre {
  int id = 0;
  String name = '';
}

class Genres {
  static Map<int, Genre> list = HashMap();

  static void add(Genre g) {
    list.addAll({g.id: g});
  }

  static Genre? getById(int id) {
    return list[id];
  }
}
