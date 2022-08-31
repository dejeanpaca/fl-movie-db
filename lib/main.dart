import 'package:flutter/material.dart';
import 'package:moviedb/material_app.dart';
import 'package:moviedb/services/connectivity.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeList>(
      create: (_) => ThemeList(),
      child: ChangeNotifierProvider<AppConnectivity>(
        create: (_) => AppConnectivity(),
        child: const MovieApp(),
      ),
    ),
  );
}
