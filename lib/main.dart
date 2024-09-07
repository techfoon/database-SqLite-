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

class MyAppDash extends StatefulWidget {
  @override
  State<MyAppDash> createState() => _MyAppDashState();
}

class _MyAppDashState extends State<MyAppDash> {
  DBhelper? mainDB;
  List<Map<String, dynamic>> allNotes = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainDB = DBhelper.getInstance();
    mainDB!.getAllNotes();
    getInitialNotes();
  }

  void getInitialNotes() async {
    allNotes = await mainDB!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hellow this is my app"),
      ),
      body: allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(allNotes[index][DBhelper.noteDataTitle]),
                  subtitle: Text(allNotes[index][DBhelper.noteDataDesc]),
                );
              })
          : Text("no notes found"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mainDB!.addNote(title: "rahul", desc: "is a boy");
          getInitialNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
