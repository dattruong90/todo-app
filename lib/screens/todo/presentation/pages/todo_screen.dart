import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/modal.dart';
import 'package:todo_app/screens/todo/presentation/pages/todo_lst_widget.dart';

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
        Modal.showBottomSheet(context);
      },
      child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface, size: 30,),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
    );
  }

  Widget _buildBody() {
    return SafeArea(
      bottom: true, 
      child: Padding(
        padding: EdgeInsets.all(Constants.cPadding_15),
        child: TodoListWidget(),
      )
    );
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
