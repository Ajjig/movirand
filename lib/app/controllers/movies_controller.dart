import 'package:get/get.dart';
import 'package:movirand/app/provider/api.dart';
import '../models/movie_model.dart';

class MoviesController extends GetxController {
  var data = <MovieModel>[].obs;
  var genres = <String>[].obs;
  int get crossSize => Get.width > 800
      ? 4
      : Get.width > 600
          ? 3
          : 2;
  int get length => data.length;
  bool get isEmpty => data.isEmpty;

  @override
  void onInit() async {
    super.onInit();
    refresh();
  }

  @override
  void refresh() async {
    data.value = await api.discover();
    super.refresh();
  }

  void filter() async {
    String query = '';
    for (var i = 0; i < genres.length; i++) {
      query += genres[i];
      if (i < genres.length - 1) query += ',';
    }
    data.value = await api.getGenre(query);
  }

  void addGenre(String genre) {
    genres.add(genre);
  }

  void removeGenre(String genre) {
    genres.remove(genre);
  }

  void clear() {
    genres.value = [];
    refresh();
  }
}
