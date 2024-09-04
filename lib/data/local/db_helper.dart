import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._(); // create private constructor

  static DBHelper getInstance() {
    return DBHelper._(); //
  }

  Database? DBvar;

  Future<Database> getDb() async {
    /// path data/data/yourPackageName/databases
    Directory appDirectory = await getApplicationDocumentsDirectory();

    String rootPath = appDirectory.path;

    /// path data/data/yourPackageName/databases/notes.db
    String dbPath = join(rootPath, "notes.db");

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT)');
      }
    );
  }
}
