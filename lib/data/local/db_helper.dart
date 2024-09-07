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

  static final String tableNote = "noteData";
  static final String noteDataTitle = "title";
  static final String noteDataDesc = "desc";
  static final String s_no = "s_no";


//Getting DataBase
  Database? myDB;
  Future<Database> getDb() async {
    if (myDB == null) {
      myDB = await openDb();
    }

    return myDB!;
  }

//Opening DataBase
  Future<Database> openDb() async {
    // path data/data/yourPackageName/database
    Directory appDirectory = await getApplicationCacheDirectory();

    String rootpath = appDirectory.path;

    String dbPath = join(rootpath,
        "notes.db"); // path data/data/yourPackageName/database/notes.db
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      //table created
      db.rawQuery(
          "create table $tableNote ($s_no integer primary key autoincrement, $noteDataTitle text, $noteDataDesc, text)");
    });
  }

  ///queries

  ///Insertdata
  Future<bool> addNote({required String title, required String desc}) async {
    var db = await getDb();
   int rowsEffected= await db.insert(tableNote, {noteDataTitle: title, noteDataDesc: desc});

    return rowsEffected > 0;
  }

  //get all data(data Fetching)

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDb();
    // return db.rawQuery("select*from $tableNote");

    var allNotes = await db.query(tableNote);
    return allNotes;
  }
}
