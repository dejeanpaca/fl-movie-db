import 'package:flutter/material.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class FavouriteButton extends StatelessWidget {
  final bool saved;
  final Function() onPressed;

  const FavouriteButton({Key? key, required this.saved, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        saved ? Icons.bookmark_added : Icons.bookmark_outline,
        color: saved ? Provider.of<ThemeList>(context).current.selectedColor : null,
      ),
    );
  }
}
