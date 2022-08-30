import 'package:flutter/widgets.dart';

class SingleFireFunction {
  bool fired = false;
  bool done = false;
  int instance = 0;

  void fire(Future<void> Function() onFire) {
    if (!fired) {
      fired = true;

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await onFire();
        done = true;
      });
    }
  }
}
