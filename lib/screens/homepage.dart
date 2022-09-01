import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../compenents/movies.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

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
    return (SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: bgColor,
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Color(0xF5011627),
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
        body: _homeItems[_index],
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.favorite, color: Colors.white),
            Icon(Icons.search, color: Colors.white),
            Icon(Icons.more_horiz_outlined, color: Colors.white)
          ],
          backgroundColor: Colors.transparent,
          color: mainColor,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) => {
            setState(() {
              _index = index;
            })
          },
        ),
      ),
    ));
  }
}
