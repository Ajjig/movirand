import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required int index,
    required PageController pageController,
  }) : _index = index, _pageController = pageController, super(key: key);

  final int _index;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: _index,
      animationCurve: Curves.easeOutCirc,
      items: [
        Icon(Icons.home, color: bgColor, size: 25),
        Icon(Icons.favorite, color: bgColor, size: 25),
        Icon(Icons.search, color: bgColor, size: 25),
        Icon(Icons.more_horiz_outlined, color: bgColor, size: 25),
      ],
      backgroundColor: Colors.transparent,
      color: mainColor,
      animationDuration: const Duration(milliseconds: 300),
      onTap: (index) => {
        _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeOutCirc),
      },
    );
  }
}

