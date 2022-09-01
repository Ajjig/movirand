import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movirand',
        theme: ThemeData(
          primaryColor: const Color(0xFF011627),
        ),
        home: const HomePage(),
      );
    }
}
