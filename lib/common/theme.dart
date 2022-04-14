import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF191D21),
    primaryColor: const Color(0xFF1814E4),
    primaryTextTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20
        )
    ),
    primaryIconTheme: IconThemeData(
      color: Colors.white
    ),
    brightness: Brightness.dark,
    fontFamily: 'Poppins');

final lightTheme = ThemeData(
    primaryColor: const Color(0XFFFA7F35),
    scaffoldBackgroundColor: Colors.white,
    primaryTextTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20
        )
    ),
    primaryIconTheme: IconThemeData(
        color: Colors.black
    ),
    brightness: Brightness.light,
    fontFamily: 'Poppins');
