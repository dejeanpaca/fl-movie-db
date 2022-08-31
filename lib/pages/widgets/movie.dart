import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/api/config.dart';
import 'package:moviedb/data/movie.dart';

import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = CachedNetworkImageProvider(ApiConfig.getPosterUrl(movie.poster));
    var theme = Provider.of<ThemeList>(context).current;

    return Row(children: [
      SizedBox(
        height: 100,
        width: 100,
        child: ClipRRect(borderRadius: BorderRadius.circular(5.0), child: Image(image: image, fit: BoxFit.cover)),
      ),
      const SizedBox(width: 12.0),
      Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(movie.title, style: theme.movieTitleStyle),
        const SizedBox(height: 8.0),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(Icons.star, color: Color(0xFFf2cf16)),
          const SizedBox(width: 8.0),
          Text('${movie.rating.toStringAsFixed(1)} / 10 IMDb', style: theme.movieRatingStyle),
        ]),
        const SizedBox(height: 8.0),
      ])),
    ]);
  }
}
