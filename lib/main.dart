import 'package:flutter/material.dart';

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
