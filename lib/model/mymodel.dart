import 'package:db_practice/data/local/db_helper.dart';
import 'package:flutter/material.dart';

class CrudModel {
  int Model_sN;
  String Model_title, Model_description;

  CrudModel(
      {required this.Model_sN,
      required this.Model_title,
      required this.Model_description});

  //fromMap MaptoModel

  factory CrudModel.fromMap(Map<String, dynamic> map) {
    return CrudModel(
        Model_sN: map[DBHelper.s_no],
        Model_title: map[DBHelper.Columntitle],
        Model_description: map[DBHelper.columndescription]);
  }

  //toMap ModeltoMap

  Map<String, dynamic> toMap() {
    return {
      DBHelper.s_no: Model_sN,
      DBHelper.Columntitle: Model_title,
      DBHelper.columndescription: Model_description,
    };
  }
}
