import 'package:moviedb/data/genres.dart';
import 'package:moviedb/utils/json_utils.dart';

class GenresResponse {
  static Genre itemFromJson(Map<String, dynamic>? json) {
    if (json == null) return Genre();

    var g = Genre();

    g.id = JsonUtils.getInt(json['id'], g.id);
    g.name = JsonUtils.getString(json['name'], g.name);
    return g;
  }

  static List<Genre> fromJson(Map<String, dynamic>? json) {
    if (json == null) return [];

    List<Genre> list = [];

    var genresJson = json['genres'];

    if (genresJson is List) {
      list = genresJson.map((item) => itemFromJson(item)).toList();
    }

    return list;
  }
}
