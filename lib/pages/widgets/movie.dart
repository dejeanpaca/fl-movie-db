import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/api/config.dart';
import 'package:moviedb/data/movie.dart';
import 'package:moviedb/pages/widgets/genre.dart';
import 'package:moviedb/pages/widgets/favourite_button.dart';
import 'package:moviedb/services/favourite.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class MovieWidget extends StatefulWidget {
  final Movie movie;

  const MovieWidget({Key? key, required this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieWidgetState();
}

class MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    var image = CachedNetworkImageProvider(ApiConfig.getPosterUrl(widget.movie.poster));
    var theme = Provider.of<ThemeList>(context).current;

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(Icons.star, color: Color(0xFFf2cf16)),
          const SizedBox(width: 8.0),
          Text('${widget.movie.rating.toStringAsFixed(1)} / 10 IMDb', style: theme.movieRatingStyle),
        ]),
        const SizedBox(height: 8.0),
        if (widget.movie.genres.isNotEmpty) Wrap(runSpacing: 7.5, children: getGenres()),
      ])),
      FavouriteButton(
          saved: widget.movie.favourite,
          onPressed: () async {
            print('WTF');
            await FavouriteService.toggle(widget.movie);
            print('WTF2');
            if (mounted) setState(() {});
          }),
    ]);
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
