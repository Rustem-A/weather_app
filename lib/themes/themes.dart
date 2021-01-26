import 'package:flutter/material.dart';

ThemeData darktheme() {
  var commonColor = Color.fromRGBO(75, 75, 75, 1);
  return ThemeData(
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColorDark: Colors.white,
    primaryColor: commonColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: commonColor,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: commonColor,
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
