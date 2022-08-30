import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData theme;
  Color backgroundColor = const Color(0xFF0e1324);
  String name;

  AppTheme({required this.theme, this.name = 'unknown'});
}
