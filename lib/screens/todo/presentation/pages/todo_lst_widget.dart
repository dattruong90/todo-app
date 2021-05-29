import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/utils/constants.dart';

class TodoListWidget extends StatefulWidget {
  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(Constants.cPadding_15, Constants.cPadding_13, Constants.cPadding_10, Constants.cPadding_13),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/checked.png'),
              ),
              SizedBox(
                width: Constants.cWidth_5,
              ),
              Text(
                '07.00 AM',
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              SizedBox(
                width: Constants.cWidth_5,
              ),
              Expanded(
                child: Text(
                  'Go jogging with Christin',
                  style: TextStyle(
                      fontSize: Constants.cFontSize_15,
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset('assets/images/trash.png'),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.015, 0.015],
              colors: [Colors.yellow, Colors.white],
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
        )
      ],
    );
  }
}