import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:loading_indicator/loading_indicator.dart';

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


class ImageLoading extends StatelessWidget {
  const ImageLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double posterWidth = (MediaQuery.of(context).size.width - 25) / 2;
    return SizedBox(
      width: posterWidth,
      height: posterWidth * 1.5,
      child: Padding(
        padding: EdgeInsets.fromLTRB(posterWidth / 2 - 30, posterWidth / 2 + 10, posterWidth / 2 - 30, posterWidth / 2 + 50),
        child: const LoadingIndicator(
          indicatorType: Indicator.lineScaleParty,
          colors: [Colors.white, Color(0xFFFF2745), Colors.greenAccent],
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
