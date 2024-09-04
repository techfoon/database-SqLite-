import 'package:flutter/material.dart';
import 'package:db_practice/data/local/db_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppDash(),
    );
  }
}

class MyAppDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBhelper db = DBhelper.getInstance();

    return Scaffold(
      appBar: AppBar(
        title: Text("hellow this is my app"),
      ),
      body: Column(
        children: [
          Text("this is my app"),
        ],
      ),
    );
  }
}
