import 'package:flutter/material.dart';
import 'package:moviedb/services/connectivity.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

import 'header_logo.dart';

class Header extends StatelessWidget {
  final double size;

  const Header({Key? key, this.size = 45.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appConnectivity = Provider.of<AppConnectivity>(context);
    var theme = Provider.of<ThemeList>(context).current;

    return Container(
        height: 84,
        alignment: Alignment.centerLeft,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const HeaderLogo(),
          const SizedBox(width: 12.0),
          if (!appConnectivity.ok())
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: theme.errorColor,
                ),
                child: Text('No connection', style: theme.defaultTextStyle)),
        ]));
  }
}
