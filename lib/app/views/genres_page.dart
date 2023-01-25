import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movirand/app/controllers/genres_controller.dart';
import '../theme/colors.dart';
import '../widgets/movie_card.dart';

class GenrePage extends StatelessWidget {
  GenrePage({Key? key}) : super(key: key);
  final controller = Get.put(GenresController());
  final arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getGenre(arg);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: const Color(0xF5011627),
          title: Center(
            child: Text(
              arg,
              style: const TextStyle(
                shadows: [Shadow(blurRadius: 20)],
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.ios_share_rounded, color: mainColor),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: bgColor,
        body: Center(
          child: Obx(
            () => GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              children: List.generate(
                controller.data.length,
                (index) {
                  return MovieCard(
                    data: controller.data[index],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
