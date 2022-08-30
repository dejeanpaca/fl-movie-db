import 'package:flutter/material.dart';
import 'package:moviedb/pages/favourites.dart';
import 'package:moviedb/pages/movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationOffset;

  // current page, must be one of the indexes above
  int currentPage = 0;

  late List<Widget> screens;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    screens = [
      const MoviesPage(),
      const FavouritesPage(),
    ];

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animationOffset = Tween(begin: Offset.zero, end: const Offset(0.0, 1.0)).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: onNavTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_added_outlined),
            label: 'Favourites',
          ),
        ],
      ),
    );
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
        });
      },
    );
  }
}
