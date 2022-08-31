import 'package:flutter/material.dart';

class FavouriteButton extends StatelessWidget {
  final bool saved;
  final Function() onPressed;

  const FavouriteButton({Key? key, required this.saved, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(saved ? Icons.bookmark_added : Icons.bookmark_outline),
    );
  }
}
