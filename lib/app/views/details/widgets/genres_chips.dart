import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/constants.dart';
import '../../../models/movie_model.dart';
import '../../../theme/colors.dart';

class GenresChips extends StatelessWidget {
  const GenresChips({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MovieModel data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: data.genres.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/genres', arguments: data.genres[index]);
                },
                child: Chip(
                  backgroundColor: mainColor,
                  label: Text(
                    data.genres[index] + ' ' + kGenreEmojis[data.genres[index]]!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
