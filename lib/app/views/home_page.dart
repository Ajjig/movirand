import 'package:movirand/app/widgets/favorites.dart';

import '../controllers/favorites_controller.dart';
import 'package:movirand/app/controllers/movies_controller.dart';
import '../widgets/movies.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/navigation_bar.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage();
}


class _HomePage extends State<HomePage> {
  final FavsController favsController = Get.put( FavsController() );
  int _index = 0;
  final MoviesController _moviesController = Get.put( MoviesController() );
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
                child: Movies(
                  moviesController: _moviesController,
                ),
                onRefresh: () async {
                  _moviesController.refresh();
                }),
            Favorites(),
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
            Get.dialog(
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              ),
            );
            _moviesController.refresh();
            Future.delayed(const Duration(milliseconds: 500), () {
              Get.back();
            });
          },
          child: Icon(Icons.shuffle_sharp, color: mainColor),
        ),
        bottomNavigationBar:
            NavBar(index: _index, pageController: _pageController),
      ),
    ));
  }
}
