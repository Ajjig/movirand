import '../compenents/movies.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../compenents/navigation_bar.dart';
import '../api/api.dart';
import '../models/movie_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage();
}

Future<List<MovieModel>> data = api.discover();

class _HomePage extends State<HomePage> {
  int _index = 0;

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: false);
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
          children: [
            RefreshIndicator(
                color: mainColor,
                backgroundColor: bgColor,
                child: const Movies(),
                onRefresh: () async {
                  data = api.discover();
                  _pageController.jumpToPage(1);
                  _pageController.animateTo(
                    0,
                    duration: const Duration(microseconds: 0),
                    curve: Curves.easeIn,
                  );
                }),
            Container(color: Colors.green.shade200),
            Container(color: Colors.blue.shade200),
            Container(color: Colors.yellow.shade200),
          ],
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: bgColor,
          onPressed: () {
            data = api.discover();
            _pageController.jumpToPage(1);
            _pageController.animateTo(
              0,
              duration: const Duration(microseconds: 1),
              curve: Curves.easeIn,
            );
          },
          child: Icon(Icons.shuffle_sharp, color: mainColor),
        ),
        bottomNavigationBar:
            NavBar(index: _index, pageController: _pageController),
      ),
    ));
  }
}
