import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//import 'path_finder.dart'

class DBhelper {
  DBhelper._();

  static DBhelper getInstance() {
    return DBhelper._();
  }

  Database? myDB;
  Future<Database> getDb() async {
    if (myDB == null) {
      myDB = await openDb();
    }

    return myDB!;
  }

  Future<Database> openDb() async {
    // path data/data/yourPackageName/database
    Directory appDirectory = await getApplicationCacheDirectory();

    String rootpath = appDirectory.path;

    String dbPath = join(rootpath,
        "notes.db"); // path data/data/yourPackageName/database/notes.db
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      //table created
      db.rawQuery(
          "create table noteData(s_no integer primary key autoincrement, title text, decription, text)");
    });
  }
}
