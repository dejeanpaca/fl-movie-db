import 'package:flutter/material.dart';

import 'header_logo.dart';

class Header extends StatelessWidget {
  final double size;

  const Header({Key? key, this.size = 45.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 84, alignment: Alignment.centerLeft, child: const HeaderLogo());
  }
}
