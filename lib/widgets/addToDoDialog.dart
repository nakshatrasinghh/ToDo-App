import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/ToDoprovider.dart';
import 'package:todo/widgets/ToDoFormWidget.dart';

class AddToDoDialogWidget extends StatefulWidget {
  @override
  _AddToDoDialogWidgetState createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add ToDo's",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ToDoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedToDo: addTodo,
            ),
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = ToDo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(), 
      );
      final provider = Provider.of<ToDoProvider>(context, listen: false);
      provider.addToDo(todo);

      Navigator.of(context).pop();
    }
  }
}
