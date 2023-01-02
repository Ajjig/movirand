import 'package:flutter/material.dart';

import 'package:movirand/app/controllers/movies_controller.dart';
import '../widgets/loading.dart';
import 'cards_container.dart';
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
        return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) =>
                CardsContainer(data: moviesController.data, index: index),
          );
      }
    });
  }
}
