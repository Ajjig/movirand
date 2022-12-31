import 'package:flutter/material.dart';
import 'package:movirand/app/screens/homepage.dart';
import 'package:movirand/app/theme/colors.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: bgColor,
      ),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Movirand',
        theme: ThemeData(
          backgroundColor: bgColor,
          primaryColor: mainColor,
        ),
        home: const HomePage(),
      ),
    );
  }
}
