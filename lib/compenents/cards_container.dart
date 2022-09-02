import 'package:flutter/material.dart';
import 'movie_card.dart';

class CardsContainer extends StatelessWidget {
  final dynamic data;
  final int index;
  const CardsContainer({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MovieCard(data: data[index]),
          MovieCard(data: data[index + 10]),
        ],
      ),
    );
  }
}
