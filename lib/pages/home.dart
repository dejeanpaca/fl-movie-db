import 'package:flutter/material.dart';
import 'package:moviedb/pages/favourites.dart';
import 'package:moviedb/pages/movies.dart';
import 'package:moviedb/ui/theme/theme_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static const int MOVIES_INDEX = 0;
  static const int FAVOURITES_INDEX = 1;

  late final AnimationController animationController;
  late final Animation animationOffset;
  late final TabController tabController;

  final moviesKey = GlobalKey<MoviesPageState>();
  final favouritesKey = GlobalKey<FavouritesPageState>();

  // current page, must be one of the indexes above
  int currentPage = 0;

  late List<Widget> screens;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    screens = [
      MoviesPage(key: moviesKey),
      FavouritesPage(key: favouritesKey),
    ];

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    tabController = TabController(length: 2, vsync: this);

    animationOffset = Tween(begin: Offset.zero, end: const Offset(0.0, 1.0)).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeList>(context).current;

    return Scaffold(
      body: SafeArea(child: getPage()),
      bottomNavigationBar: Container(
          color: theme.navbarColor,
          height: 60,
          child: TabBar(
            controller: tabController,
            indicator: UnderlineTabIndicator(
              insets: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 57.0),
              borderSide: BorderSide(width: 3.0, color: theme.selectedColor),
            ),
            tabs: [
              getNavbarTab(Icons.movie_outlined, 'Movies'),
              getNavbarTab(Icons.bookmark_added_outlined, 'Favourites'),
            ],
            onTap: onNavTapped,
          )),
    );
  }

  Tab getNavbarTab(IconData icon, String caption) {
    return Tab(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(padding: const EdgeInsets.only(right: 7.5), child: Icon(icon)),
      Text(caption),
    ]));
  }

  void onNavTapped(int newPage) {
    pageController.animateToPage(newPage,
        duration: const Duration(milliseconds: 250), curve: Curves.fastLinearToSlowEaseIn);
  }

  Widget getPage() {
    return PageView(
      controller: pageController,
      children: screens,
      onPageChanged: (newPage) {
        setState(() {
          currentPage = newPage;
          tabController.index = newPage;

          if (currentPage == MOVIES_INDEX) {
            if (moviesKey.currentState != null) moviesKey.currentState!.refresh();
          }

          if (currentPage == FAVOURITES_INDEX) {
            if (favouritesKey.currentState != null) favouritesKey.currentState!.refresh();
          }
        });
      },
    );
  }
}
