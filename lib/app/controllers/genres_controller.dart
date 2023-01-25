import 'package:get/get.dart';
import '../provider/api.dart';
import '../models/movie_model.dart';

class GenresController extends GetxController {
  var data = <MovieModel>[].obs;

  int get crossSize => Get.width > 800
      ? 4
      : Get.width > 600
          ? 3
          : 2;
  int get length => data.length;
  bool get isEmpty => data.isEmpty;

  void getGenre(String genre) async {
    data.value = await api.getGenre(genre);
    super.refresh();
  }

}
