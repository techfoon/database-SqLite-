import 'package:db_practice/data/local/db_helper.dart';
import 'package:db_practice/main.dart';
import 'package:db_practice/providers/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurdProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _allData = [];

  DBHelper mainDB;

  CurdProvider({required this.mainDB});

  void addingNotes(
      {required String DTitle, required String DDescription}) async {
    bool isNoteADDed = await mainDB.addNote(title: DTitle, desc: DDescription);

    if (isNoteADDed) {
      _allData = await mainDB.getAllNotes();
      notifyListeners();
    }
  }

  /// geting notes
  ///
  ///

  void getInitNotes() async {
    _allData = await mainDB.getAllNotes();
    notifyListeners();
  }

  //

  List<Map<String, dynamic>> getNotesData() {
    return _allData;
  }
}
