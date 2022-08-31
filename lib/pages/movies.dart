import 'package:flutter/material.dart';
import 'package:moviedb/data/movie.dart';
import 'package:moviedb/pages/widgets/header_text.dart';
import 'package:moviedb/services/movie_service.dart';
import 'package:moviedb/utils/single_fire.dart';
import 'widgets/header.dart';
import 'widgets/movie.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoviesPageState();
}

class MoviesPageState extends State<MoviesPage> with AutomaticKeepAliveClientMixin<MoviesPage> {
  bool isLoading = true;
  int currentPage = 1;
  final SingleFireFunction initial = SingleFireFunction();
  List<Movie> movies = [];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    initial.fire(() => loadPage());

    return isLoading
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()],
          ))
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Header(),
                  const HeaderText(caption: 'Popular'),
                  const SizedBox(height: 24.0),
                  Expanded(child: ListView(shrinkWrap: true, children: getMovies())),
                ])),
              ],
            ));
  }

  Future<void> loadPage() async {
    movies = await MovieService.fetchMovies(page: currentPage);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<Widget> getMovies() {
    List<Widget> list = [];

    for (var m in movies) {
      list.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: MovieWidget(
            movie: m,
            stateCallback: () {
              setState(() {});
            },
          )));
    }

    return list;
  }
}
