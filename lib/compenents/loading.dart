import 'package:flutter/material.dart';
import '../colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: bgColor,
        child:
            Center(child: CircularProgressIndicator(color: mainColor)));
  }
}
