import 'package:flutter/material.dart';
import 'package:moviedb/pages/widgets/header.dart';
import 'package:moviedb/pages/widgets/header_text.dart';

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
    return const [];
  }
}
