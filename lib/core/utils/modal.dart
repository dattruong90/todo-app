import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Modal {
  static void showBottomSheet(BuildContext context, Widget screen, double screenHeight) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: screenHeight,
          child: screen,
        );
      },
    );
  }
}
