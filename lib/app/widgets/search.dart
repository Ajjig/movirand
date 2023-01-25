import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movirand/app/theme/colors.dart';
import 'package:movirand/app/views/movie_details_page.dart';
import 'package:movirand/app/widgets/movie_card.dart';
import '../controllers/search_controller.dart';

class SearchMovies extends StatelessWidget {
  final SearchController controller = Get.put(SearchController());

  SearchMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: mainColor,
              style: const TextStyle(
                color: Colors.white,
                shadows: [Shadow(blurRadius: 20)],
              ),
              onChanged: (value) {
                controller.search(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.white30,
                  shadows: [Shadow(blurRadius: 20)],
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.length == 0
                  ? const Center(
                      child: Text(
                        'No results',
                        style: TextStyle(
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 20)],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.length,
                      itemBuilder: (_, index) {
                        return controller.length <= 2
                            ? ListView.builder(
                                itemCount: controller.length,
                                itemBuilder: (_, index) {
                                  return MovieCard(
                                    data: controller.data[index],
                                  );
                                },
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: Get.width,
                                    color: Colors.white,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          'details',
                                          arguments: controller.data[index],
                                        );
                                      },
                                      child: Text(
                                        controller.data[index].title,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          shadows: [Shadow(blurRadius: 20)],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    height: 0,
                                    color: Colors.teal,
                                  ),
                                ],
                              );
                      }),
            ),
          ),
        ],
      ),
    );
  }
}
