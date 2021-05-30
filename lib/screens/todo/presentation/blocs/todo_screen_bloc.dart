import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/todo/domain/entities/todo.dart';
import 'package:todo_app/screens/todo/domain/usecases/todo_usecase.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_event.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_state.dart';

class TodoScreenBloc extends Bloc<TodoScreenEvent, TodoScreenState> {
  final TodoUsecase todoUsecase;

  TodoScreenBloc(this.todoUsecase) : super(TodoScreenLoading());

  @override
  Stream<TodoScreenState> mapEventToState(TodoScreenEvent event) async* {
    try {
      if (event is FetchTodoScreen) {
        yield* _mapFetchTodoScreenToState();
      } else if (event is AddTodoScreen) {
        yield* _mapAddTodoScreenToState(event.task);
      } else if (event is DeleteTodoScreen) {
        yield* _mapDeleteTodoScreenToState(event.id);
      } else if (event is MakeDoneTodoScreen) {
        yield* _mapMakeDoneTodoScreenToState(event.id);
      }
    } catch (e) {
      yield TodoScreenFailure(e.toString());
    }
  }

  Stream<TodoScreenState> _mapFetchTodoScreenToState() async* {
    final tasks = await this.todoUsecase.fetchTodos();
    yield TodoScreenLoaded(tasks);
  }

  Stream<TodoScreenState> _mapAddTodoScreenToState(Todo task) async* {
    yield TodoScreenLoading();
    await this.todoUsecase.addTodo(task);
    yield TodoScreenSuccess();
  }

  Stream<TodoScreenState> _mapMakeDoneTodoScreenToState(String id) async* {
    yield TodoScreenLoading();
    await this.todoUsecase.makeDoneTodo(id);
    final tasks = await this.todoUsecase.fetchTodos();
    yield TodoScreenLoaded(tasks);
  }

  Stream<TodoScreenState> _mapDeleteTodoScreenToState(String id) async* {
    yield TodoScreenLoading();
    await this.todoUsecase.deleteTodo(id);
    final tasks = await this.todoUsecase.fetchTodos();
    yield TodoScreenLoaded(tasks);
  }
}
