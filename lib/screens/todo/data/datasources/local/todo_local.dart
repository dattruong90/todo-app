import 'package:todo_app/screens/todo/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

abstract class TodoLocal {
  Future<List<TodoModel>> fetchTodos();
  Future<void> addTodo(TodoModel task);
  Future<void> deleteTodo(String id);
}

class TodoLocalImpl implements TodoLocal {
  final List<TodoModel> _tasks = [];

  TodoLocalImpl() {
    var uuid = Uuid();
    _tasks.add(TodoModel(uuid.v1(), DateTime.now(), 'Send project file'));
    _tasks.add(TodoModel(uuid.v1(), DateTime.now(), 'Meeting with client'));
    _tasks.add(TodoModel(uuid.v1(), DateTime(2021, 5, 28, 3), 'Do urgent task'));
    _tasks.add(TodoModel(uuid.v1(), DateTime(2021, 5, 28, 6), 'Make document'));
    _tasks.add(TodoModel(
        uuid.v1(), DateTime(2021, 5, 27, 3), 'Test throught features'));
  }

  @override
  Future<List<TodoModel>> fetchTodos() async {
    return this._tasks;
  }

  @override
  Future<void> addTodo(TodoModel task) async {
    this._tasks.add(task);
  }

  @override
  Future<void> deleteTodo(String id) async {
    var task =
        this._tasks.firstWhere((element) => element.id == id, orElse: () => null);
    if (task != null) this._tasks.remove(task);
  }
}
