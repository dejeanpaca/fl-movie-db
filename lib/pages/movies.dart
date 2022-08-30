import 'package:flutter/material.dart';
import 'package:moviedb/services/movie_service.dart';
import 'package:moviedb/utils/single_fire.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoviesPageState();
}

class MoviesPageState extends State<MoviesPage> {
  bool isLoading = true;
  int currentPage = 1;
  final SingleFireFunction initial = SingleFireFunction();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initial.fire(() => loadPage());

    return isLoading
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          ))
        : Column(mainAxisAlignment: MainAxisAlignment.center, children: const []);
  }

  Future<void> loadPage() async {
    await MovieService.fetchMovies(page: currentPage);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
