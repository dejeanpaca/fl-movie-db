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

  final scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(pagination);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    initial.fire(() => loadPage());

    var theme = Provider.of<ThemeList>(context).current;
    var appConnectivity = Provider.of<AppConnectivity>(context);

    return isLoading && movies.isEmpty
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              progressIndicator(),
            ],
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
                  if (hasMovies()) Expanded(child: getListView()),
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
    var current = await MovieService.fetchMovies(page: currentPage);

    movies.addAll(current);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget getMovie(Movie m) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: MovieWidget(
          movie: m,
          stateCallback: () {
            setState(() {});
          },
        ));
  }

  Widget getListView() {
    return ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: !isLoading ? movies.length : movies.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == movies.length) return progressIndicator();

          return getMovie(movies[index]);
        });
  }

  Widget progressIndicator() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: CircularProgressIndicator(),
          )),
    ]);
  }

  void refresh() {
    setState(() {});
  }

  bool hasMovies() {
    return movies.isNotEmpty;
  }

  void pagination() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
        ++currentPage;
      });

      loadPage();
    }
  }
}
