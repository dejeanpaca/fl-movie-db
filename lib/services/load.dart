import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedb/api/api_requests.dart';
import 'package:moviedb/app.dart';
import 'package:moviedb/pages/home.dart';

import 'db.dart';

/// load our startup state
Future<void> load(BuildContext context) async {
  var navigator = Navigator.of(context);

  // portrait-only mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Db.createStorage();
  await App.movieDb.initialize();

  await ApiRequests.initialize();

  await Future.delayed(const Duration(milliseconds: 250));

  if (navigator.mounted) navigator.pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
}
