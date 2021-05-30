import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/widgets/datetime_picker_widget.dart';
import 'package:todo_app/screens/todo/presentation/blocs/todo_screen_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todo.dart';
import '../blocs/todo_screen_event.dart';

class TodoCreateScreen extends StatefulWidget {
  @override
  _TodoCreateScreenState createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  TodoScreenBloc _todoScreenBloc;
  final TextEditingController _taskEditingController = TextEditingController();
  DateTime _dateTimeText = DateTime.now();
  final _uuid = Uuid();

  @override
  void initState() {
    this._todoScreenBloc = BlocProvider.of<TodoScreenBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _taskEditingController.dispose();
    super.dispose();
  }

  void setDateTime(DateTime dateTime) {
    _dateTimeText = dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Positioned(
          top: Constants.cMargin_24,
          left: 0,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(175, 30),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Constants.cPadding_15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.surface,
                          size: Constants.cIcon_30,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Constants.cCornerRadius_50),
                            ),
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Add new task',
                      style: TextStyle(
                          fontSize: Constants.cFontSize_13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Form(
                    key: this._formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          autofocus: false,
                          controller: this._taskEditingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter task';
                            }
                            return null;
                          },
                          style: TextStyle(
                              fontSize: Constants.cFontSize_22,
                              fontStyle: FontStyle.normal),
                          cursorColor:
                              Theme.of(context).colorScheme.primaryVariant,
                          decoration: InputDecoration(
                            hintText: 'New task',
                            hintStyle:
                                TextStyle(fontSize: Constants.cFontSize_13),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Choose date',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: Constants.cFontSize_13),
                        ),
                        SizedBox(height: 5),
                        DatetimePickerWidget(this.setDateTime),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                this._todoScreenBloc.add(AddTodoScreen(Todo(
                                    this._uuid.v1(),
                                    this._dateTimeText,
                                    this._taskEditingController.text,
                                    false)));
                                this._taskEditingController.text = '';
                              }
                            },
                            child: Text("Add task"),
                            style: TextButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                primary: Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            Constants.cCornerRadius_5))),
                                textStyle: TextStyle(
                                    fontSize: Constants.cFontSize_17,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
