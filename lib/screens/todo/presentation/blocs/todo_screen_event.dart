import 'package:equatable/equatable.dart';
import 'package:todo_app/screens/todo/domain/entities/todo.dart';

abstract class TodoScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTodoScreen extends TodoScreenEvent {
}

class AddTodoScreen extends TodoScreenEvent {
  final Todo task;

  AddTodoScreen(this.task);

  @override
  List<Object> get props => [this.task];
}

class DeleteTodoScreen extends TodoScreenEvent {
  final String id;

  DeleteTodoScreen(this.id);

  @override
  List<Object> get props => [this.id];
}
