import 'package:flutter/material.dart';
import 'package:movirand/app/controllers/movies_controller.dart';
import '../widgets/loading.dart';
import 'cards_container.dart';
import 'package:get/get.dart';

class Movies extends StatelessWidget {
  MoviesController _controller;

  Movies({required MoviesController controller}) : _controller = controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.data.isEmpty) {
        return const Loading();
      } else {
        return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) =>
                CardsContainer(data: _controller.data, index: index),
          );
      }
    });
  }
}
