import 'package:moviedb/services/db.dart';

class App {
  static const String title = 'MovieDB';
  static Db movieDb = Db('movies.db');
}
