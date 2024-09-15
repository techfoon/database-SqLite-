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
  List<Map<String, dynamic>> allNotes = [];

  DBHelper? mainDB;

  @override
  void initState() {
   
    super.initState();
     mainDB = DBHelper.getInstance;
    getInitialNotes();
  }

  getInitialNotes() async {
    allNotes = await mainDB!.getAllNotes();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App#1"),
      ),
      body: allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(allNotes[index][DBHelper.Columntitle]),
                  subtitle: Text(allNotes[index][DBHelper.columndescription]),
                );
              })
          : Text("no notes found"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mainDB!.addNote(title: "kumar", desc: "baman");
          getInitialNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
