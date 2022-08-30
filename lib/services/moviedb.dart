import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'db.dart';

class MovieDb extends Db {
  MovieDb() : super('movie.db') {
    version = 2;
  }

  @override
  Future<Database> open() async {
    return await openDatabase(
      dbName,
      version: version,
      onCreate: onCreate,
    );
  }

  FutureOr<void> onCreate(Database db, int version) async {
    // create the movies table
    await db.execute(
        'CREATE TABLE favourites (id INTEGER PRIMARY KEY, movie_id, INTEGER, title TEXT, rating REAL, description TEXT, backdrop TEXT)');

    // table for movie genres
    await db.execute('CREATE TABLE movie_genres (id INTEGER PRIMARY KEY, movie INTEGER, genre INTEGER)');
  }
}
