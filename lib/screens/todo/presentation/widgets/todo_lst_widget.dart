import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/screens/todo/domain/entities/todo.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_bloc.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_event.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_state.dart';

import '../../../../core/utils/constants.dart';

class TodoListWidget extends StatefulWidget {
  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  TodoScreenBloc _todoScreenBloc;

  @override
  void initState() {
    this._todoScreenBloc = BlocProvider.of<TodoScreenBloc>(context);
    this._todoScreenBloc.add(FetchTodoScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoScreenBloc, TodoScreenState>(
      builder: (context, state) {
        if (state is TodoScreenLoading) {
          return Padding(
            padding: EdgeInsets.only(top: Constants.cPadding_10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
        } else if (state is TodoScreenFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is TodoScreenLoaded) {
          return this._buildLstTodo(state.tasks);
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildLstTodo(List<Todo> tasks) {
    int colorCount = Constants.colors.length;
    return GroupedListView<dynamic, DateTime>(
        elements: tasks,
        groupBy: (task) {
          return DateTime(task.date.year, task.date.month, task.date.day);
        },
        groupSeparatorBuilder: (DateTime date) {
          return _buildTodoGroupSeparator(date);
        },
        order: GroupedListOrder.DESC,
        indexedItemBuilder: (context, dynamic task, int index) {
          return this._buildTodo(task, index, colorCount);
        });
  }

  Widget _buildTodoGroupSeparator(DateTime date) {
    return Container(
      margin: EdgeInsets.only(top: Constants.cMargin_10),
      child: Text(
        DateFormat('dd/MM/yyyy').format(date),
        style: TextStyle(
            fontSize: Constants.cFontSize_13, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildTodo(Todo todo, int index, int colorCount) {
    return Container(
      margin: EdgeInsets.only(top: Constants.cMargin_10),
      padding: EdgeInsets.fromLTRB(Constants.cPadding_15, Constants.cPadding_13,
          Constants.cPadding_10, Constants.cPadding_13),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print(todo.id);
              this._todoScreenBloc.add(MakeDoneTodoScreen(todo.id)); 
            },
            child: todo.status
                ? Image.asset('assets/images/checked.png' , width: 20, height: 20, fit: BoxFit.fill,)
                : Image.asset('assets/images/checked-empty.png' , width: 20, height: 20, fit: BoxFit.fill,),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            DateFormat('HH:mm').format(todo.date),
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              todo.task,
              style: TextStyle(
                  fontSize: Constants.cFontSize_15,
                  color: Theme.of(context).colorScheme.secondary,
                  decoration: todo.status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ),
          GestureDetector(
            onTap: () {
              print(todo.id);
              this._todoScreenBloc.add(DeleteTodoScreen(todo.id));
            },
            child: Image.asset('assets/images/trash.png', width: 20, height: 20, fit: BoxFit.fill,),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.015, 0.015],
          colors: [Constants.colors[index % colorCount], Colors.white],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Constants.cCornerRadius_5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: Constants.cBlurRadius_10,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
    );
  }
}
