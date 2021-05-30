import 'package:todo_app/screens/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
  Future<Todo> addTodo(Todo task);
  Future<Todo> deleteTodo(String id);
  Future<Todo> makeDoneTodo(String id);
}