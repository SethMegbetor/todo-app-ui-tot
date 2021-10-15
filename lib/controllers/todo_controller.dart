import 'dart:convert';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoController {
  final TodoService _todoService = TodoService();

  Future<Todo?> getAllTodos() async {
    Todo? _todo;

    await _todoService.getAllTodoRequest().then((response) {
      print(response.body);
      int statusCode = response.statusCode;
      if (statusCode == 200) {
        // success
        _todo = Todo.fromMap(json.decode(response.body));
      } else {
// error
        _todo = null;
      }
    }).catchError((onError) {
      print(onError);
      _todo = null;
    });
    return _todo;
  }
}
