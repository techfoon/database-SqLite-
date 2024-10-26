import 'dart:developer'; 
import 'package:db_practice/data/local/db_helper.dart';
import 'package:db_practice/main.dart';
import 'package:db_practice/model/mymodel.dart';
import 'package:db_practice/providers/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurdProvider extends ChangeNotifier {
  List<NoteModel> _allData = [];

  DBHelper mainDB;

  CurdProvider({required this.mainDB});

  void addingNotes({required NoteModel newNote}) async {
    bool isNoteADDed = await mainDB.addNote(newModel: newNote);

    if (isNoteADDed) {
      _allData = await mainDB.getAllNotes();
      notifyListeners();
    }
  }

  void updateProviderNotes(
      {required int uIndex, required NoteModel newNote}) async {
    bool isNoteupdated =
        await mainDB.updateNotes(rowIndex: uIndex, newModel: newNote);

    if (isNoteupdated) {

       log("Passed"); 
      _allData = await mainDB.getAllNotes();
      notifyListeners();
    } else {
      log("failed");  //  my log shows error why
    }
  }

  void deleteNotes({required int uIndex}) async {
    var delNotes = await mainDB.deleteNotes(rowIndex: uIndex);


      if (delNotes) {

       
      _allData = await mainDB.getAllNotes();
      notifyListeners();
    } else {
      log(" delNotes: failed");  //  my log shows error why
    }

    
  }

  /// geting notes

  void getInitNotes() async {
    _allData = await mainDB.getAllNotes();
    notifyListeners();
  }

  //

  List<NoteModel> getNotesData() {
    return _allData;
  }
}
