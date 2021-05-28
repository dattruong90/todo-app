import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/size_config.dart';

abstract class Constants {
  // Color
  static const cPrimaryColor = Color(0XFF5890e3);
  static const cPrimaryTextColor = Colors.white;
  static const cSecondaryTextColor = Colors.black;
  static const cBackgroundColor = Color(0xFFECEFF1);

  // Padding
  static final cPadding_5 = getProportionateScreenWidth(5.0);

  // Margin
  static final cMarginTop_20 = getProportionateScreenHeight(15.0);

  // Font
  static final cFontSize_15 = getProportionateScreenWidth(15.0);
  
  // Icon Size
  static final cIconSize_12 = getProportionateScreenWidth(12.0);

  // Width Size
  static final cWidthSize_3 = getProportionateScreenWidth(3.0);

  // Height Size
  static final cHeightSize_20 = getProportionateScreenHeight(20.0);
}
