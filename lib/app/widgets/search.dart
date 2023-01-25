import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movirand/app/theme/colors.dart';
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
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
                // border
                fillColor: Colors.teal,
                prefixIconColor: Colors.teal,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
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
                        return Column(
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
