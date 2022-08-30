import 'dart:io';

import 'package:moviedb/utils/misc.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  late Database db;
  String dbName;

  Db(this.dbName);

  Future<void> initialize() async {
    db = await openDatabase(dbName);
    print('Database $dbName open ${db.isOpen}');
  }

  Future<void> done() async {
    await db.close();
  }

  bool ok() {
    return db.isOpen;
  }

  static Future<void> createStorage() async {
    var databasesPath = await getDatabasesPath();

    try {
      var dir = Directory(databasesPath);
      if (!dir.existsSync()) await dir.create(recursive: true);
    } catch (s, e) {
      printException(s, e);
    }
  }
}
