import 'package:flutter/material.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class HeaderText extends StatelessWidget {
  final String caption;

  const HeaderText({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(caption, style: Provider.of<ThemeList>(context).current.headerTextStyle);
  }
}
