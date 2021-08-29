import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/ToDoprovider.dart';
import 'package:todo/widgets/TodoWidget.dart';

class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context);

    final todos = provider.toDos;

    return todos.isEmpty
        ? Center(child: Text('No Todos'))
        : ListView.separated(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ToDoWidget(todo: todo);
            },
            separatorBuilder: (context, index) =>
                Container(height: 8, color: Colors.grey[300]));
  }
}
