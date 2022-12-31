import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../models/movie_model.dart';

class CardsContainer extends StatefulWidget {
  final List<MovieModel>? data;
  final int index;
  const CardsContainer({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  State<CardsContainer> createState() => _CardsContainerState();
}

class _CardsContainerState extends State<CardsContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MovieCard(data: widget.data![widget.index]),
          MovieCard(data: widget.data![widget.index + 10]),
        ],
      ),
    );
  }
}
