import 'package:todo_app/screens/todo/data/datasources/local/todo_local.dart';
import 'package:todo_app/screens/todo/domain/entities/todo.dart';
import 'package:todo_app/screens/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImplement implements TodoRepository {
  TodoRepositoryImplement(this.localSource);
  final TodoLocal localSource;

  @override
  Future<List<Todo>> fetchTodos() {
    return localSource.fetchTodos();
  }

  @override
  Future<Todo> addTodo(Todo task) {
    return localSource.addTodo(task);
  }

  @override
  Future<Todo> deleteTodo(String id) {
    return localSource.deleteTodo(id);
  }

  @override
  Future<Todo> makeDoneTodo(String id) {
     return localSource.makeDoneTodo(id);
  }
}
