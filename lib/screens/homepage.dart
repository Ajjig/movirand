import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../compenents/movies.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../compenents/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _index = 0;
  final List<Widget> _homeItems = [
    const Movies(),
    Container(color: Colors.green.shade200),
    Container(color: Colors.blue.shade200),
    Container(color: Colors.yellow.shade200),
  ];

  @override
  Widget build(BuildContext context) {
    PageController _pageController =  PageController(initialPage: 0, keepPage: true);
    return (SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: bgColor,
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: const Color(0xF5011627),
          title: const Center(
            child: Text(
              'Home',
              style: TextStyle(
                shadows: [Shadow(blurRadius: 20)],
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: PageView(
          children: _homeItems,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: bgColor,
          onPressed: () {},
          child: Icon(Icons.shuffle_sharp, color: mainColor),
        ),
        bottomNavigationBar: NavBar(index: _index, pageController: _pageController),
      ),
    ));
  }
}
