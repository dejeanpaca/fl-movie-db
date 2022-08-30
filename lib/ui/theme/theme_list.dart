import 'package:flutter/material.dart';
import 'package:moviedb/ui/theme/app_theme.dart';

class ThemeList extends ChangeNotifier {
  static AppTheme light = AppTheme(theme: ThemeData.light(), name: 'light');
  static AppTheme dark = AppTheme(theme: ThemeData.dark(), name: 'dark');

  AppTheme current = light;
}
