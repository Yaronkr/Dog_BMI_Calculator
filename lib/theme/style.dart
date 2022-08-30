import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//TODO - use for all widgets properties including font size.

ThemeData appTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: HexColor("F9F5EB"),
    appBarTheme: AppBarTheme(
      backgroundColor: HexColor("#0c3a53"),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: HexColor("F9F5EB"),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: HexColor("1C3879"),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: HexColor("1C3879"),
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}


// NAME         SIZE  WEIGHT  SPACING
// headline1    96.0  light   -1.5
// headline2    60.0  light   -0.5
// headline3    48.0  regular  0.0
// headline4    34.0  regular  0.25
// headline5    24.0  regular  0.0
// headline6    20.0  medium   0.15
// subtitle1    16.0  regular  0.15
// subtitle2    14.0  medium   0.1
// body1        16.0  regular  0.5   (bodyText1)
// body2        14.0  regular  0.25  (bodyText2)
// button       14.0  medium   1.25
// caption      12.0  regular  0.4
// overline     10.0  regular  1.5