import 'package:flutter/cupertino.dart';
import 'package:todo/model/todo.dart';

// Add ToDo's Here
class ToDoProvider extends ChangeNotifier {
  List<ToDo> _toDos = [
    ToDo(createdTime: DateTime.now(), title: 'Walk the dog 🐕', description: '''
    - Walk the dog
      '''),
    ToDo(createdTime: DateTime.now(), title: 'Eat some food', description: '''
      - Eat chicken
      '''),
    ToDo(createdTime: DateTime.now(), title: 'Android & iOS', description: '''
      - Native support
      '''),
    ToDo(createdTime: DateTime.now(), title: 'Flutter 2.0', description: '''
      - Null safety support
      '''),
  ];

  List<ToDo> get toDos => _toDos.where((todo) => todo.isDone == false).toList();

  List<ToDo> get todosCompleted =>
      _toDos.where((todo) => todo.isDone == true).toList();

  void addToDo(ToDo todo) {
    _toDos.add(todo);
    notifyListeners();
  }

  void removeToDo(ToDo todo) {
    _toDos.remove(todo);
    notifyListeners();
  }

  bool toggleToDoStatus(ToDo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateToDo(ToDo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
