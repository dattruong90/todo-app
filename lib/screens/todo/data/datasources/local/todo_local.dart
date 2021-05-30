import 'dart:io';

import 'package:todo_app/screens/todo/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

abstract class TodoLocal {
  Future<List<TodoModel>> fetchTodos();
  Future<TodoModel> addTodo(TodoModel task);
  Future<TodoModel> deleteTodo(String id);
  Future<TodoModel> makeDoneTodo(String id);
}

class TodoLocalImpl implements TodoLocal {
  final List<TodoModel> _tasks = [];

  TodoLocalImpl() {
    var uuid = Uuid();
    _tasks
        .add(TodoModel(uuid.v1(), DateTime.now(), 'Send project file', false));
    _tasks
        .add(TodoModel(uuid.v1(), DateTime.now(), 'Meeting with client', true));
    _tasks.add(
        TodoModel(uuid.v1(), DateTime(2021, 5, 28, 3), 'Do urgent task', true));
    _tasks.add(
        TodoModel(uuid.v1(), DateTime(2021, 5, 28, 6), 'Make document', true));
    _tasks.add(TodoModel(
        uuid.v1(), DateTime(2021, 5, 27, 3), 'Test throught features', true));
  }

  @override
  Future<List<TodoModel>> fetchTodos() {
    return Future.delayed(
      Duration(seconds: 3),
      () => this._tasks,
    );
  }

  @override
  Future<TodoModel> addTodo(TodoModel task) {
    return Future(() {
      this._tasks.add(task);

      return task;
    });
  }

  @override
  Future<TodoModel> deleteTodo(String id) {
    return Future(() {
      var task = this
          ._tasks
          .firstWhere((element) => element.id == id, orElse: () => null);
      if (task != null) this._tasks.remove(task);

      return task;
    });
  }

  @override
  Future<TodoModel> makeDoneTodo(String id) {
    return Future(() {
      var task = this
          ._tasks
          .firstWhere((element) => element.id == id, orElse: () => null);
      if (task != null) task.status = !task.status;

      return task;
    });
  }
}
