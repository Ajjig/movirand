import 'package:flutter/material.dart';
import 'package:movirand/app/controllers/movies_controller.dart';
import 'package:movirand/app/widgets/movie_card.dart';
import '../widgets/loading.dart';
import 'package:get/get.dart';

class Movies extends StatelessWidget {
  final MoviesController moviesController;

  const Movies({Key? key, required this.moviesController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (moviesController.data.isEmpty) {
        return const Loading();
      } else {
        return GridView(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: moviesController.crossSize,
            childAspectRatio: 0.7,
          ),
          children: List.generate(
            moviesController.length,
            (index) => MovieCard(
              data: moviesController.data[index],
            ),
          ),
        );
      }
    });
  }
}
