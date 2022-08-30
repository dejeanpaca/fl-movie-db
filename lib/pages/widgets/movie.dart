import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/api/config.dart';
import 'package:moviedb/data/movie.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = CachedNetworkImageProvider(ApiConfig.getPosterUrl(movie.poster));

    return Row(children: [
      SizedBox(
        height: 100,
        width: 100,
        child: Image(image: image, fit: BoxFit.cover),
      ),
      const SizedBox(width: 12.0),
      Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(movie.title),
        const SizedBox(height: 12.0),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Icon(Icons.star, color: Color(0xFFf2cf16)),
          const SizedBox(width: 12.0),
          Text('${movie.rating.toStringAsFixed(1)} / 10 IMDb'),
        ]),
        const SizedBox(height: 12.0),
      ])),
    ]);
  }
}
