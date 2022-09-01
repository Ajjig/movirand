import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movirand',
        theme: ThemeData(
          backgroundColor: bgColor,
          primaryColor: mainColor,
        ),
        home: const HomePage(),
      );
    }
}
