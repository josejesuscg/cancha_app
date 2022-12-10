import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.green,
    colorScheme: const ColorScheme.light(
      primary: Colors.green,
      secondary: Colors.green
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.green),
      actionsIconTheme: IconThemeData(color: Colors.green)
    ),
    iconTheme: const IconThemeData(
      // color: Colors.green
    ),
    textTheme: const TextTheme(
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 18
      ),
      headline5: TextStyle(
        color: Colors.green,
        fontSize: 25,
        fontWeight: FontWeight.w900
      ),
       subtitle1: TextStyle(
        color: Colors.green,
        fontSize: 15,
        fontWeight: FontWeight.w900
      ),
       subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w900
      )
    )

  );
}
