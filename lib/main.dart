import 'package:flutter/material.dart';
import './app/views/home/home_page.dart';
import './app/theme/colors.dart';
import 'package:flutter/services.dart';
import './app/views/details/details_page.dart';
import 'app/data/CONSTANTS.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/views/genres/genres_page.dart';

void main() async {
  await GetStorage.init('favorites');
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: bgColor,
      ),
      child: GetMaterialApp(
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page: () => const HomePage()),
          GetPage(name: '/genres', page: () => GenrePage()),
          GetPage(name: '/details', page: () => MovieDetails())
        ],
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: ThemeData(
          backgroundColor: bgColor,
          primaryColor: mainColor,
        ),
      ),
    );
  }
}
