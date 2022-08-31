import 'package:flutter/material.dart';
import 'package:moviedb/ui/theme/app_theme.dart';

class ThemeList extends ChangeNotifier {
  static const Color darkTextColor = Color(0xFFE4ECEF);

  static AppTheme light = AppTheme(
    theme: ThemeData(
      brightness: Brightness.light,
      fontFamily: 'sf',
    ),
    name: 'light',
    textColor: Colors.black,
  );

  static AppTheme dark = AppTheme(
    theme: ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'sf',
      scaffoldBackgroundColor: const Color(0xFF0e1324),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF010510),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFFec9b3e),
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
    name: 'dark',
    textColor: const Color(0xFFE4ECEF),
  );

  AppTheme current = dark;
}
