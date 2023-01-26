import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movirand/app/theme/colors.dart';
import '../../../controllers/favorites_controller.dart';
import '../../../widgets/movie_card.dart';

class Favorites extends StatelessWidget {
  final FavsController favsController = Get.find<FavsController>();

  Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favsController.isEmpty) {
      return Container(
        color: bgColor,
        child: const Center(
          child: Text('No favorites yet',
              style: TextStyle(color: Color(0xFFFF2745), fontSize: 20)),
        ),
      );
    }
    return Obx(
      () => (GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        children: List.generate(
          favsController.length,
          (index) => Stack(
            children: [
              MovieCard(
                data: favsController.favs[index],
              ),
              Positioned(
                top: 0,
                right: 40,
                child: IconButton(
                  onPressed: () {
                    favsController.remove(favsController.favs[index]);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 50,
                    color: Color(0xFFFF2745),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
