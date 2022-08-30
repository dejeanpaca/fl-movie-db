import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  final double size;

  const HeaderLogo({Key? key, this.size = 45.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image(width: size, height: size, image: const AssetImage('assets/images/logo.png')),
    );
  }
}
