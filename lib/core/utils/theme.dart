import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/constants.dart';

ThemeData buildPrimaryThemeData(BuildContext context) {
  return Theme.of(context).copyWith(
    primaryColor: Constants.cPrimaryColor,
    scaffoldBackgroundColor: Constants.cBackgroundColor,
    appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        elevation: 0), // Change text color of status bar
    textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Constants.cPrimaryVariantTextColor),
    colorScheme: ColorScheme.light().copyWith(
        // Text color
        primary: Constants.cPrimaryTextColor,
        primaryVariant: Constants.cPrimaryVariantTextColor,
        secondary: Constants.cSecondTextColor,
        // Icon color
        surface: Constants.cIconColor,
        // Background color
        background: Constants.cBackgroundColor,
        // Button color
        onBackground: Constants.cButtonBackgroundColor
    )
  );
}
