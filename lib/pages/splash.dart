import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedb/pages/home.dart';
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
    loadFire.fire(load);

    var theme = Provider.of<ThemeList>(context).current;
    print(theme.name);

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
    // portrait-only mode
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(milliseconds: 250));

    if (navigator.mounted) navigator.pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
