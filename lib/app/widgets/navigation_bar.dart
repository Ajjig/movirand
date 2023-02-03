// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GlassmorphicContainer(
        width: double.infinity,
        height: 80,
        borderRadius: 30,
        blur: 25,
        border: 1,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.05),
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: List.generate(
            4,
            (index) {
              return (index % 2 == 0)
                  ? mainColor.withOpacity(0.5)
                  : Colors.teal.withOpacity(0.5);
            },
          ),
        ),
        child: DotNavigationBar(
          itemPadding:
              const EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
          margin: const EdgeInsets.only(top: 5, bottom: 0, left: 5, right: 5),
          paddingR: EdgeInsets.zero,
          borderRadius: 20,
          currentIndex: _index,
          // boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black)],
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.white,
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.favorite),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.search),
            ),
            DotNavigationBarItem(icon: const Icon(Icons.filter_list_outlined))
          ],
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
