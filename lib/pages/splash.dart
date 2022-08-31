import 'package:flutter/material.dart';
import 'package:moviedb/services/load.dart';
import 'package:moviedb/utils/single_fire.dart';

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

    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Center(
            child: Image(
          width: 120.0,
          height: 120.0,
          image: AssetImage('assets/images/logo.png'),
        )),
      ])),
    );
  }
}
