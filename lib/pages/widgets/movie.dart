import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/api/config.dart';
import 'package:moviedb/data/movie.dart';
import 'package:moviedb/pages/details/details.dart';
import 'package:moviedb/pages/widgets/genre.dart';
import 'package:moviedb/pages/widgets/rating.dart';
import 'package:moviedb/services/favourite.dart';
import 'package:moviedb/ui/progress_dialog.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';
import 'favourite_button.dart';

class MovieWidget extends StatefulWidget {
  final Movie movie;

  final Function()? stateCallback;

  const MovieWidget({Key? key, required this.movie, this.stateCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieWidgetState();
}

class MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    var image = CachedNetworkImageProvider(ApiConfig.getPosterUrl(widget.movie.poster));
    var theme = Provider.of<ThemeList>(context).current;

    var content = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 100,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image(image: image, fit: BoxFit.cover),
        ),
      ),
      const SizedBox(width: 12.0),
      Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.movie.title, style: theme.movieTitleStyle),
        const SizedBox(height: 8.0),
        RatingWidget(rating: widget.movie.rating),
        const SizedBox(height: 8.0),
        if (widget.movie.genres.isNotEmpty) Wrap(runSpacing: 7.5, children: getGenres()),
      ])),
      FavouriteButton(
          saved: widget.movie.favourite,
          onPressed: () async {
            await showProgressDialog(context, FavouriteService.toggle(widget.movie));

            if (mounted) setState(() {});
            if (widget.stateCallback != null) widget.stateCallback!();
          }),
    ]);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: content,
      onTap: () async {
        await Navigator.push(context, createDetailsRoute());
        if (widget.stateCallback != null) widget.stateCallback!();
      },
    );
  }

  Route createDetailsRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MovieDetails(movie: widget.movie),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);

        var tween = Tween(begin: begin, end: Offset.zero).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  List<Widget> getGenres() {
    List<Widget> list = [];

    for (var g in widget.movie.genres) {
      list.add(Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: GenreTag(genre: g),
      ));
    }

    return list;
  }
}
