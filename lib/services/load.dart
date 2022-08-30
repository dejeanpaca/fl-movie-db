import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedb/api/api_requests.dart';
import 'package:moviedb/app.dart';
import 'package:moviedb/pages/home.dart';
import 'package:moviedb/services/movie_service.dart';

import 'db.dart';

/// load our startup state
Future<void> load(BuildContext context) async {
  var start = DateTime.now();

  var navigator = Navigator.of(context);

  // portrait-only mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Db.createStorage();
  await App.movieDb.initialize();

  await ApiRequests.initialize();

  await MovieService.fetchGenres();

  // show the splash screen a bit, but account for startup time
  var elapsed = DateTime.now().difference(start).inMilliseconds;
  var waitTime = 1000 - elapsed;

  if (waitTime > 0) await Future.delayed(Duration(milliseconds: waitTime));

  // open the home page
  if (navigator.mounted) navigator.pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
}
