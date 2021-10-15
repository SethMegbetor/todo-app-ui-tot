import 'dart:convert';

import 'package:http/http.dart';

class TodoService {
  Future<Response> getAllTodoRequest(bool status) async {
    return await get(Uri.parse("https://dog-xss.cyclic-app.com/todos/$status"));
  }

  Future<Response> getTodoByIdRequest(String id) async {
    return await get(Uri.parse("https://dog-xss.cyclic-app.com/todos/$id"));
  }

// create new todo
  createTodoRequest(
      {required String title,
      required String description,
      required String date}) async {
    Map<String, String> body = {
      "title": title,
      "description": description,
      "date_time": date
    };

    Map<String, String> header = {'Content-Type': 'application/json'};

    return await post(Uri.parse("https://dog-xss.cyclic-app.com/todos"),
        body: jsonEncode(body), headers: header);
  }

  // update status of todo
  Future<Response> updateTodoRequest(
      {required bool status, required String id}) async {
    Map<String, bool> body = {"status": status};
    return await patch(Uri.parse("https://dog-xss.cyclic-app.com/todos/$id"),
        body: body);
  }

  // delete todo
  Future<Response> deleteTodo(String id) async {
    return await delete(Uri.parse("https://dog-xss.cyclic-app.com/todos/$id"));
  }
}
