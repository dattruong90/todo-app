import 'package:todo_app/screens/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
}