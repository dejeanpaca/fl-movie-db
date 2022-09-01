import 'package:flutter/material.dart';

class CNIPlaceholderWrapper extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color? color;

  const CNIPlaceholderWrapper({Key? key, this.width = 30, this.height = 30, required this.child, this.color = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(child: child),
    );
  }
}

class CNIPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const CNIPlaceholder({Key? key, this.width = 30, this.height = 30, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CNIPlaceholderWrapper(
        width: width,
        height: height,
        color: color,
        child: SizedBox(
          width: width / 2,
          height: height / 2,
          child: const CircularProgressIndicator(),
        ));
  }
}

class CNIError extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const CNIError({Key? key, this.width = 30, this.height = 30, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CNIPlaceholderWrapper(
      width: width,
      height: height,
      color: color,
      child: const Icon(Icons.broken_image),
    );
  }
}
