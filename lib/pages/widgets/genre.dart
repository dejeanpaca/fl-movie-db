import 'package:flutter/cupertino.dart';
import 'package:moviedb/data/genres.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class GenreTag extends StatelessWidget {
  final Genre genre;
  final double? fontSize;
  final EdgeInsets? padding;

  const GenreTag({Key? key, required this.genre, this.fontSize, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeList>(context).current;

    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: theme.genreTagColor,
      ),
      child:
          Text(genre.name, style: fontSize != null ? theme.genreStyle.copyWith(fontSize: fontSize!) : theme.genreStyle),
    );
  }
}
