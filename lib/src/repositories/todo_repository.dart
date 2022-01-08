import 'package:dio/dio.dart';

import 'package:api_flutter/src/models/todo_model.dart';

class TodoRepository {
  //final dio = Dio();
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos/';

  TodoRepository([Dio? cliente]) : dio = cliente ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json) => TodoModel.fromJson(json)).toList();
    /*
    for (var json in list) {
      final todo = TodoModel.fromJson(json);
      todos.add(todo);
    }

    return todos;
    */
  }
}
