import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData theme;
  final Color textColor;
  final String name;

  final Color selectedColor;

  late final TextStyle headerTextStyle;
  late final TextStyle movieTitleStyle;
  late final TextStyle movieRatingStyle;
  late final TextStyle genreStyle;
  final Color genreTagColor;

  late final TextStyle detailsTitleStyle;

  final Color navbarColor = const Color(0xFF010510);
  late final TextStyle navbarLabelStyle;
  late final TextStyle selectedNavbarLabelStyle;

  AppTheme({
    required this.theme,
    this.name = 'unknown',
    required this.textColor,
    required this.genreTagColor,
    required this.selectedColor,
  }) {
    headerTextStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w600, fontSize: 22, color: textColor);
    movieTitleStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w600, fontSize: 15, color: textColor);
    movieRatingStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w400, fontSize: 12, color: textColor);
    genreStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w400, fontSize: 11, color: textColor);
    detailsTitleStyle = TextStyle(fontFamily: 'sf', fontSize: 20, fontWeight: FontWeight.w600, color: textColor);
    navbarLabelStyle = TextStyle(fontFamily: 'sf', fontSize: 12, fontWeight: FontWeight.w600, color: textColor);
    selectedNavbarLabelStyle =
        TextStyle(fontFamily: 'sf', fontSize: 12, fontWeight: FontWeight.w600, color: selectedColor);
  }
}
