import 'package:flutter/material.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeList>(context).current;

    return Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Icon(Icons.star, color: Color(0xFFf2cf16)),
      const SizedBox(width: 8.0),
      Text('${rating.toStringAsFixed(1)} / 10 IMDb', style: theme.movieRatingStyle),
    ]);
  }
}
