import 'package:flutter/material.dart';
import 'package:moviedb/services/load.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:moviedb/utils/single_fire.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SingleFireFunction loadFire = SingleFireFunction();

  @override
  Widget build(BuildContext context) {
    loadFire.fire(() => load(context));

    var theme = Provider.of<ThemeList>(context).current;

    return Scaffold(
      backgroundColor: const Color(0xFF0e1324),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Center(child: Image(width: 120.0, height: 120.0, image: AssetImage('assets/images/logo.png'))),
      ])),
    );
  }
}
