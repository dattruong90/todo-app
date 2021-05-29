import 'package:equatable/equatable.dart';
import 'package:todo_app/screens/todo/domain/entities/todo.dart';

abstract class TodoScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoScreenLoading extends TodoScreenState {}

class TodoScreenLoaded extends TodoScreenState {
  final List<Todo> tasks;

  TodoScreenLoaded(this.tasks);

  @override
  List<Object> get props => [this.tasks];
}

class TodoScreenFailure extends TodoScreenState {
  final String message;

  TodoScreenFailure(this.message);

  @override
  List<Object> get props => [this.message];
}
