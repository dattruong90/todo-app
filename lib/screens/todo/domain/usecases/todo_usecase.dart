import 'package:todo_app/screens/todo/domain/entities/todo.dart';
import 'package:todo_app/screens/todo/domain/repositories/todo_repository.dart';

class TodoUsecase {
  final TodoRepository _todoRepository;

  TodoUsecase(this._todoRepository);

  Future<List<Todo>> fetchTodos() async {
    return await this._todoRepository.fetchTodos();
  }

  Future<Todo> addTodo(Todo task) async {
    return await this._todoRepository.addTodo(task);
  }

  Future<Todo> deleteTodo(String id) async {
    return await this._todoRepository.deleteTodo(id);
  }

  Future<Todo> makeDoneTodo(String id) async {
    return await this._todoRepository.makeDoneTodo(id);
  }
}