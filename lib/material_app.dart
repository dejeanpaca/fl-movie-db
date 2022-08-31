import 'package:flutter/material.dart';
import 'package:moviedb/app.dart';
import 'package:moviedb/pages/splash.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: App.appKey,
      title: 'MovieDB',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeList>(context).current.theme,
      home: const SplashPage(),
    );
  }
}
