import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static DBHelper getInstance = DBHelper._();

  static final String s_no = "s_no";
  static final String Columntitle = "title";
  static final String columndescription = "description";
  static final String notesDataTable = "notesData";

  ///Globle
  Database? myDB;

  Future<Database> getDb() async {
    if (myDB == null) {
      myDB = await openDb();
       stdout.write("DatBase is not availabe but created");
    } else {
      stdout.write("DatBase is available");
     
    }

    return myDB!;
  }

  ///Open DB
  Future<Database> openDb() async {
    ///data/data/yourPackageName/databases
    Directory appDirectory = await getApplicationCacheDirectory();
    String rootPath = appDirectory.path;

    /// path data/data/yourPackageName/databases/notes.db
    String dbPath = join(rootPath, "notes.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.rawQuery(
          "create table $notesDataTable($s_no integer primary key autoincrement, $Columntitle text, $columndescription text)");
    });
  }

  //queries
  ///insert
  Future<bool> addNote({required String title, required String desc}) async {
    var db = await getDb();
    int rowsEffected = await db.insert(notesDataTable, {Columntitle: title, columndescription: desc});

 stdout.write("method is called return: $rowsEffected");           
    return rowsEffected > 0;
  }

  ///get all data
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDb();
    var allNotes = await db.query(notesDataTable);

    return allNotes;
  }
}
