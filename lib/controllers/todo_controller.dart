import 'dart:convert';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/services/todo_service.dart';

class TodoController {
  final TodoService _todoService = TodoService();

  Future<Todo?> getAllTodos({bool status = false}) async {
    Todo? _todo;

    await _todoService.getAllTodoRequest(status).then((response) {
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

  Future<bool> createTodo(
      {required String title,
      required String description,
      required String date}) async {
    bool isSuccessful = false;
    await _todoService
        .createTodoRequest(title: title, description: description, date: date)
        .then((response) {
      int statusCode = response.statusCode;
      if (statusCode == 201) {
        //successful
        isSuccessful = true;
      } else {
        //error
        isSuccessful = false;
      }
    }).catchError((onError) {
      isSuccessful = false;
    });
    return isSuccessful;
  }
}
