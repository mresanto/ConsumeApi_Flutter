// @dart=2.9
import 'package:api_flutter/src/controller/home_controller.dart';
import 'package:api_flutter/src/models/todo_model.dart';
import 'package:api_flutter/src/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();

  final controller = HomeController();
  test('Deve modificar o estado para error se a requisição falhar', () async {
    when(repository.fetchTodos()).thenThrow(Exception());
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    //expect(controller.todos.isNotEmpty, true);
  });
}
