import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData theme;
  Color backgroundColor = const Color(0xFF0e1324);
  String name;

  TextStyle headerTextStyle;

  AppTheme({required this.theme, this.name = 'unknown', required this.headerTextStyle});
}
