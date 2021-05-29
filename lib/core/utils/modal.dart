import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Modal {
  static void showBottomSheet(BuildContext context1) {
    showModalBottomSheet(
      context: context1,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 280,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Positioned(
                top: 20,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                                size: 30,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            'Add new task',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextFormField(
                          initialValue: 'Book a table for dinner ',
                          autofocus: true,
                          style: TextStyle(
                              fontSize: 22, fontStyle: FontStyle.normal),
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Choose date',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Text(
                              'Today, 19:00 - 21:00',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 5),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(Icons.chevron_right),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
