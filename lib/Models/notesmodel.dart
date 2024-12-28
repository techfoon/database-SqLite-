

import 'package:db_practice/data/local/db_helper.dart';

class NotesModel {
  int? s_n;

  String title, description;

  NotesModel({required this.title, required this.description, this.s_n});

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      s_n: map[DBHelper.s_no],
      title: map[DBHelper.Columntitle],
      description: map[DBHelper.columndescription],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.s_no: s_n,
      DBHelper.Columntitle: title,
      DBHelper.columndescription: description
    };
  }
}
