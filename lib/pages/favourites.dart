import 'package:flutter/material.dart';
import 'package:moviedb/data/favourites.dart';
import 'package:moviedb/pages/widgets/header.dart';
import 'package:moviedb/pages/widgets/header_text.dart';
import 'package:moviedb/pages/widgets/movie.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Header(),
              const HeaderText(caption: 'Favourites'),
              Expanded(child: ListView(shrinkWrap: true, children: getFavourites())),
            ])),
          ],
        ));
  }

  List<Widget> getFavourites() {
    List<Widget> list = [];

    for (var m in Favourites.list.entries) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: MovieWidget(movie: m.value),
      ));
    }

    return list;
  }
}
