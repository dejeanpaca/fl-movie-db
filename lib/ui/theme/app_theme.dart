import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData theme;
  final Color textColor;
  final String name;

  late final TextStyle headerTextStyle;
  late final TextStyle movieTitleStyle;
  late final TextStyle movieRatingStyle;
  late final TextStyle genreStyle;
  final Color genreTagColor;

  AppTheme({
    required this.theme,
    this.name = 'unknown',
    required this.textColor,
    required this.genreTagColor,
  }) {
    headerTextStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w600, fontSize: 22, color: textColor);
    movieTitleStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w600, fontSize: 15, color: textColor);
    movieRatingStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w400, fontSize: 12, color: textColor);
    genreStyle = TextStyle(fontFamily: 'sf', fontWeight: FontWeight.w400, fontSize: 11, color: textColor);
  }
}
