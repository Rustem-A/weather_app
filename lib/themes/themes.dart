import 'package:flutter/material.dart';

ThemeData darktheme() {
  return ThemeData(
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColorDark: Colors.white,
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Color(0xff212224),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Color(0xff212224),
  );
}

ThemeData lighttheme() {
  return ThemeData(
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}

//dark
//0xff212224
//0xfffa5235
//0xff3d3d3d
//#3e3f41

//light
//sc #d6d6d6
//#f95309
//#e8e8e8
//#828282
