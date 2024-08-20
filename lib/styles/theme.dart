import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 22,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.blue[100],
    selectedIconTheme: const IconThemeData(size: 35, color: Colors.white),
    unselectedIconTheme: const IconThemeData(size: 35),
    selectedItemColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    color: Color.fromRGBO(223, 242, 255, 1),
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      minimumSize: WidgetStateProperty.all(const Size(600, 50)),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
    ),
  ),
);
