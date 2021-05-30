import 'package:equatable/equatable.dart';

class Todo  extends Equatable {
  final String id;
  final DateTime date;
  final String task;
  bool status;
  
  Todo(this.id, this.date, this.task, this.status);

  @override
  List<Object> get props => [id, date, task, status];
}
