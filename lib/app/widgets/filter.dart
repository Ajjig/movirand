import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movirand/app/controllers/movies_controller.dart';
import '../theme/colors.dart';
import '../data/constants.dart';

class FilterPage extends GetView<MoviesController> {
  FilterPage({Key? key}) : super(key: key);


  final allGenres = kMovieGenres.values.toList();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.blueGrey[900],
      icon: Icon(Icons.filter_alt_rounded, color: mainColor),
      content: Container(
        color: Colors.blueGrey[900],
        child: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Select prefered genres.', style: TextStyle(color: mainColor)),
              const SizedBox(height: 20),
              Obx(
                () => Wrap(
                  children: List.generate(
                    allGenres.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                          selectedColor: mainColor,
                          label: Text(allGenres[index]),
                          selected: controller.genres.contains(allGenres[index]),
                          onSelected: (value) {
                            if (value) {
                              controller.addGenre(allGenres[index]);
                            } else {
                              controller.removeGenre(allGenres[index]);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
