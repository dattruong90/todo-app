import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/modal.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_bloc.dart';
import 'package:todo_app/screens/todo/presentation/pages/todo_create_screen.dart';
import 'package:todo_app/screens/todo/presentation/widgets/todo_lst_widget.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatActionButton(),
    );
  }

  Widget _buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Modal.showBottomSheet(context, BlocProvider.value(
            value: BlocProvider.of<TodoScreenBloc>(context), child: TodoCreateScreen()), 260);
      },
      child: Icon(Icons.add,
          color: Theme.of(context).colorScheme.surface,
          size: Constants.cIcon_30),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }

  Widget _buildBody() {
    return SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.cPadding_15),
          child: TodoListWidget(),
        ));
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Container(
        child: Text(
          'Hello user!',
          style: TextStyle(
              fontSize: Constants.cFontSize_19, fontWeight: FontWeight.w600),
        ),
      ),
      actions: <Widget>[
        Container(
          child: Image.asset('assets/images/photo.png'),
        ),
      ],
    );
  }
}
