import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:moviedb/app.dart';
import 'package:moviedb/utils/periodic_runner.dart';
import 'package:provider/provider.dart';

class AppConnectivity extends ChangeNotifier {
  ConnectivityResult? connectivity;
  final AppConnectivityChecker checker = AppConnectivityChecker();

  Future<void> initialize() async {
    connectivity = await Connectivity().checkConnectivity();
    checker.run();
  }

  Future<void> update() async {
    var current = await Connectivity().checkConnectivity();

    // only update if changed
    if (current != connectivity) {
      print('App connectivity changed to $current');
      connectivity = current;
      notifyListeners();
    }
  }

  bool ok() {
    return connectivity != ConnectivityResult.none;
  }
}

class AppConnectivityChecker extends PeriodicRunner {
  AppConnectivityChecker() {
    runAlways = true;
    runEvery = const Duration(milliseconds: 5000);
  }

  @override
  Future<void> onRun() async {
    if (App.appKey.currentContext == null) return;

    var connectivity = Provider.of<AppConnectivity>(App.appKey.currentContext!, listen: false);

    await connectivity.update();
  }
}
