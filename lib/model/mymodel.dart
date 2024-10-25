import 'package:db_practice/data/local/db_helper.dart';
import 'package:flutter/material.dart';

class NoteModel {
  String Model_sN = "Model_sN";
  String Model_title, Model_description;
  NoteModel({required this.Model_title, required this.Model_description});
  
  //fromMap MaptoModel
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        Model_title: map[DBHelper.Columntitle],
        Model_description: map[DBHelper.columndescription]);
  }
  //toMap ModeltoMap
  Map<String, dynamic> toMap() {
    return {
      DBHelper.Columntitle: Model_title,
      DBHelper.columndescription: Model_description,
    };
  }
}
