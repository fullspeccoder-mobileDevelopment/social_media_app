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
    selectedItemColor: Colors.blue[900],
  ),
  cardTheme: const CardTheme(
    color: Color.fromRGBO(223, 242, 255, 1),
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color.fromRGBO(162, 202, 247, 1),
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.grey,
    thickness: 1,
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 5, color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  searchBarTheme: const SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(Colors.white),
    shadowColor: WidgetStatePropertyAll(Colors.transparent),
    padding: WidgetStatePropertyAll(
      EdgeInsets.fromLTRB(8, 8, 8, 8),
    ),
    side: WidgetStatePropertyAll(BorderSide(color: Colors.grey)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.blue[400],
    contentTextStyle: const TextStyle(color: Colors.white),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      minimumSize: WidgetStateProperty.all(const Size(600, 50)),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: const CircleBorder(),
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue.shade400,
    elevation: 0,
  ),
);
