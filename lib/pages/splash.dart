import 'package:flutter/material.dart';
import 'package:moviedb/home.dart';
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
    loadFire.fire(load);

    return Scaffold(
      backgroundColor: const Color(0xFF0e1324),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Center(child: Image(width: 120.0, height: 120.0, image: AssetImage('assets/images/logo.png'))),
      ])),
    );
  }

  /// load our startup state
  Future<void> load() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(milliseconds: 5000));

    if (navigator.mounted) navigator.pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
