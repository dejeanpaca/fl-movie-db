import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/data/movie.dart';
import 'package:moviedb/pages/widgets/header_text.dart';
import 'package:moviedb/services/connectivity.dart';
import 'package:moviedb/services/movie_service.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:moviedb/utils/single_fire.dart';
import 'package:provider/provider.dart';
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

    var theme = Provider.of<ThemeList>(context).current;
    var appConnectivity = Provider.of<AppConnectivity>(context);

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
                  if (kDebugMode)
                    Text(appConnectivity.connectivity.toString(),
                        style: const TextStyle(fontFamily: 'sf', fontSize: 10)),
                  const HeaderText(caption: 'Popular'),
                  const SizedBox(height: 24.0),
                  if (hasMovies()) Expanded(child: ListView(shrinkWrap: true, children: getMovies())),
                  if (!appConnectivity.ok() && !hasMovies())
                    Expanded(
                        child: Center(
                            child: Text(
                      'Cannot load popular movies, you do not seem to be connected',
                      style: theme.defaultTextStyle,
                      textAlign: TextAlign.center,
                    ))),
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

  void refresh() {
    setState(() {});
  }

  bool hasMovies() {
    return movies.isNotEmpty;
  }
}
