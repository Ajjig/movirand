import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/movie_model.dart';

class FavsController extends GetxController {
  final _favs = <MovieModel>[].obs;
  final GetStorage box = GetStorage('favorites');

  bool              get isEmpty => _favs.isEmpty;
  List<MovieModel>  get favs => _favs;
  int               get length => _favs.length;

  @override
  void onInit() async {
    super.onInit();
    box.getValues().forEach((key, value) {
      _favs.add(MovieModel.fromJson(value));
    });
  }

  void add(MovieModel movie) {
    _favs.add(movie);
    box.write(movie.id.toString(), movie.toJson());
  }

  void remove(MovieModel movie) {
    _favs.remove(movie);
    box.remove(movie.id.toString());
  }

  bool isFavorite(MovieModel movie) {
    return favs.contains(movie);
  }

}