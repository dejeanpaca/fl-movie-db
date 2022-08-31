import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'db.dart';

class MovieDb extends Db {
  MovieDb() : super('movie.db') {
    version = 3;
  }

  @override
  Future<Database> open() async {
    return await openDatabase(await constructPath(), version: version, onCreate: onCreate, onUpgrade: onUpgrade);
  }

  FutureOr<void> onCreate(Database db, int version) async {
    // create the movies table
    await db.execute('CREATE TABLE favourites (id INTEGER PRIMARY KEY, movie_id, INTEGER, title TEXT, rating REAL, '
        'description TEXT, backdrop TEXT, poster TEXT)');

    // table for movie genres
    await db.execute('CREATE TABLE movie_genres (id INTEGER PRIMARY KEY, movie INTEGER, genre INTEGER)');

    // table for genres
    await db.execute('CREATE TABLE genres (id INTEGER PRIMARY KEY, genre_id INTEGER, name TEXT)');

    print('Created $dbName version $version');
  }

  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    // simplest migration is starting anew
    db.execute('DROP TABLE IF EXISTS favourites');
    db.execute('DROP TABLE IF EXISTS movie_genres');
    db.execute('DROP TABLE IF EXISTS genres');

    // recreate
    await onCreate(db, version);

    print('Upgraded database to version $newVersion from $oldVersion');
  }

  /// execute an sql query
  Future<void> execute(String sql, [List<Object?>? arguments]) async {
    await db.execute(sql, arguments);
  }
}
