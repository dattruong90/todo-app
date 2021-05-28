import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/constants.dart';

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
        // Add your onPressed code here!
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
    );
  }

  Widget _buildBody() {
    return SafeArea(bottom: true, child: null);
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Container(
        child: Text(
          'Hello Brenda!',
          style: TextStyle(
              fontSize: Constants.cFontSize_15, fontWeight: FontWeight.w600),
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
