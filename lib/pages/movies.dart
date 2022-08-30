import 'package:flutter/material.dart';
import 'package:moviedb/pages/widgets/header_text.dart';
import 'package:moviedb/services/movie_service.dart';
import 'package:moviedb/utils/single_fire.dart';
import 'widgets/header.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MoviesPageState();
}

class MoviesPageState extends State<MoviesPage> with AutomaticKeepAliveClientMixin<MoviesPage> {
  bool isLoading = true;
  int currentPage = 1;
  final SingleFireFunction initial = SingleFireFunction();

  @override
  void initState() {
    super.initState();
  }

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
                  Expanded(child: ListView(shrinkWrap: true, children: getMovies())),
                ])),
              ],
            ));
  }

  Future<void> loadPage() async {
    await MovieService.fetchMovies(page: currentPage);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<Widget> getMovies() {
    return [];
  }

  @override
  bool get wantKeepAlive => true;
}
