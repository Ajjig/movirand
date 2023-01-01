import 'package:flutter/material.dart';
import 'package:movirand/app/models/movie_model.dart';
import 'package:movirand/app/views/home_page.dart';
import 'package:movirand/app/theme/colors.dart';
import 'package:flutter/services.dart';
import 'app/data/CONSTANTS.dart';
import 'package:get/get.dart';
import 'app/views/movie_details_page.dart';
import 'package:get_storage/get_storage.dart';

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
        ],
        debugShowCheckedModeBanner: false,
        title: APP_TITLE,
        theme: ThemeData(
          backgroundColor: bgColor,
          primaryColor: mainColor,
        ),
      ),
    );
  }
}
