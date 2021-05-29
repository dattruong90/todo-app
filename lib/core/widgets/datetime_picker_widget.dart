import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/constants.dart';

class DatetimePickerWidget extends StatefulWidget {
  @override
  _DatetimePickerWidgetState createState() => _DatetimePickerWidgetState();
}

class _DatetimePickerWidgetState extends State<DatetimePickerWidget> {
  DateTime _dateTime = DateTime.now();

  String _getText() {
    return DateFormat('dd/MM/yyyy HH:mm').format(_dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickDateTime(context);
      },
      child: Row(
        children: <Widget>[
          Text(
            this._getText(),
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: Constants.cFontSize_13, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 5),
          RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      _dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        helpText: 'Select date',
        initialDate: this._dateTime ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Constants.cPrimaryColor, // header background color
                onPrimary: Constants.cPrimaryTextColor, // header text color
                onSurface:
                    Constants.cPrimaryVariantTextColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Constants.cPrimaryColor, // button text color
                ),
              ),
            ),
            child: child,
          );
        });

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
                hour: this._dateTime.hour, minute: this._dateTime.minute),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Constants.cPrimaryColor, // number color
                onPrimary: Constants.cPrimaryTextColor, // selected number color
                onSurface:
                    Constants.cPrimaryVariantTextColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Constants.cPrimaryColor, // button text color
                ),
              ),
            ),
            child: child,
          );
        });

    if (newTime == null) return null;

    return newTime;
  }
}
