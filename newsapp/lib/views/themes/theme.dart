// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final newsLightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color.fromRGBO(39, 139, 146, 1),
  cardColor: const Color.fromRGBO(245, 245, 245, 1),
  colorScheme: ColorScheme.light(),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    // toolbarHeight: 30,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      //app name styling
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: const Color.fromRGBO(39, 139, 146, 1),
    ),
    headline2: TextStyle(
      //Tabs styling
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
    ),
    headline3: TextStyle(
      //Setting styling (Drawer ListTiles)
      fontSize: 16,
      color: Color.fromRGBO(39, 139, 146, 1),
    ),
  ),
  iconTheme: IconThemeData(
    size: 16,
    color: const Color.fromRGBO(39, 139, 146, 1),
  ),
);

final newsDarkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: const Color.fromRGBO(39, 139, 146, 1),
  cardColor: Colors.grey.shade900,
  colorScheme: ColorScheme.dark(),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    // toolbarHeight: 30,
  ),
  iconTheme: IconThemeData(
    size: 18,
    color: const Color.fromRGBO(39, 139, 146, 1),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      //app name styling
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: const Color.fromRGBO(39, 139, 146, 1),
    ),
    headline2: TextStyle(
      //Tabs styling
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    ),
    headline3: TextStyle(
      //Setting styling (Drawer ListTiles)
      fontSize: 16,
      color: Color.fromRGBO(39, 139, 146, 1),
    ),
  ),
);
