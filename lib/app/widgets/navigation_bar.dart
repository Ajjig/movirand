// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required int index,
    required PageController pageController,
  })  : _index = index,
        _pageController = pageController,
        super(key: key);

  final int _index;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      borderRadius: 20,
      currentIndex: _index,
      boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black)],
      onTap: (index) {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      selectedItemColor: mainColor,
      unselectedItemColor: bgColor,
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.home),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.search),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.favorite),
        ),
        DotNavigationBarItem(
          icon: const Icon(Icons.more_horiz_outlined),
        ),
      ],
      backgroundColor: Colors.teal,
    );
  }
}
