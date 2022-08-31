import 'package:flutter/cupertino.dart';
import 'package:moviedb/services/moviedb.dart';

class App {
  static const String title = 'MovieDB';
  static const String language = 'en_US';
  static MovieDb movieDb = MovieDb();

  static GlobalKey<State<StatefulWidget>> appKey = GlobalKey<State<StatefulWidget>>();
}
