import 'package:flutter/material.dart';
import 'package:movirand/app/controllers/favorites_controller.dart';
import 'movie_card.dart';
import '../models/movie_model.dart';

class CardsContainer extends StatelessWidget {
  final List<MovieModel>? data;
  final FavsController controller;
  final int index;
  const CardsContainer({
    Key? key,
    required this.data,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MovieCard(data: data![index], controller: controller),
          MovieCard(data: data![index + 10], controller: controller),
        ],
      ),
    );
  }
}
