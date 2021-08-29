import 'package:flutter/material.dart';
import 'package:todo/widgets/ToDoListWidget.dart';
import 'package:todo/widgets/addToDoDialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[300],
          title: Text(
            'TO DO App',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          elevation: 0,
        ),
        body: ToDoListWidget(),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () => showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => AddToDoDialogWidget()),
          child: Icon(Icons.add),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ));
  }
}
