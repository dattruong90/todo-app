import 'package:todo_app/screens/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel(String id, DateTime date, String task, bool status) : super(id, date, task, status);
}