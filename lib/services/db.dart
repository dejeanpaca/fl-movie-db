import 'dart:io';

import 'package:moviedb/utils/misc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  late Database db;
  String dbName;
  int version = 0;

  Db(this.dbName);

  Future<String> constructPath() async {
    return join(await getDatabasesPath(), dbName);
  }

  /// opens the db.
  /// should override with db specific logic
  Future<Database> open() async {
    return openDatabase(dbName, version: version);
  }

  Future<void> initialize() async {
    db = await open();
    print('Database $dbName open ${db.isOpen} @ ${db.path}');
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
      if (!dir.existsSync()) {
        await dir.create(recursive: true);
        print('Created databases path: ${dir.path}');
      }
    } catch (s, e) {
      printException(s, e);
    }
  }
}
