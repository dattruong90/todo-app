import 'package:todo_app/screens/todo/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

abstract class TodoLocal {
  Future<List<TodoModel>> fetchTodos();
}

class TodoLocalImpl implements TodoLocal {
  final List<TodoModel> tasks = [];
  
  TodoLocalImpl() {
    var uuid = Uuid();
    tasks.add(TodoModel(uuid.v1(), DateTime.now(), 'Send project file'));
    tasks.add(TodoModel(uuid.v1(), DateTime.now(), 'Meeting with client'));
    tasks.add(TodoModel(uuid.v1(), DateTime(2021, 5, 28, 3), 'Do urgent task'));
    tasks.add(TodoModel(uuid.v1(), DateTime(2021, 5, 28, 6), 'Make document'));
    tasks.add(TodoModel(uuid.v1(), DateTime(2021, 5, 27, 3), 'Test throught features'));
  }

  @override
  Future<List<TodoModel>> fetchTodos() async {
    return tasks;
  }
}
