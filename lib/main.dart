import 'package:flutter/material.dart';
import 'package:movirand/app/controllers/search_controller.dart';
import './app/views/home/home_page.dart';
import './app/theme/colors.dart';
import 'package:flutter/services.dart';
import './app/views/details/details_page.dart';
import 'app/controllers/favorites_controller.dart';
import 'app/controllers/genres_controller.dart';
import 'app/controllers/movies_controller.dart';
import 'app/data/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/views/genres/genres_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // put is used to initialize the controllers
    Get.put(MoviesController());
    Get.put(FavsController());
    Get.put(GenresController());
    Get.put(SearchController());


    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: bgColor,
      ),
      child: GetMaterialApp(
        getPages: [
          GetPage(name: '/', page: () => const HomePage()),
          GetPage(name: '/genres', page: () => GenrePage()),
          GetPage(name: '/details', page: () => MovieDetails())
        ],
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark().copyWith(
            primary: mainColor,
            secondary: bgColor,
          ),
          primaryColor: mainColor,
        ),
      ),
    );
  }
}
