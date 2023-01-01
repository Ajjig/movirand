import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/movie_model.dart';

class FavsController extends GetxController {
  final favs = <MovieModel>[].obs;
  GetStorage box = GetStorage('favorites');

  @override
  void onInit() async {
    super.onInit();
    box.getValues().forEach((key, value) {
      favs.add(MovieModel.fromJson(value));
    });
  }

  void add(MovieModel movie) {
    favs.add(movie);
    box.write(movie.id.toString(), movie.toJson());
  }

  void remove(MovieModel movie) {
    favs.remove(movie);
    box.remove(movie.id.toString());
  }

  bool isFavorite(MovieModel movie) {
    return favs.contains(movie);
  }
}