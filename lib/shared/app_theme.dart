import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    appBarTheme: const AppBarTheme(color: Colors.indigo),
    inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
  );

  static ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    appBarTheme: const AppBarTheme(color: Colors.indigo),
    inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
  );
}