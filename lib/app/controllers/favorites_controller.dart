import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/movie_model.dart';

class FavsController extends GetxController {
  final _favs = <MovieModel>[].obs;
  late GetStorage box;

  bool              get isEmpty => _favs.isEmpty;
  List<MovieModel>  get favs => _favs;
  int               get length => _favs.length;

  @override
  void onInit() async {
    box = GetStorage();
    _favs.value = box.getValues().values.map((e) => MovieModel.fromJson(e)).toList();
    super.onInit();
  }

  void add(MovieModel movie) async {
    _favs.add(movie);
    await box.write(movie.id, movie.toJson());
  }

  void remove(MovieModel movie) async {
    _favs.remove(movie);
    await box.remove(movie.id);
  }

  bool isFavorite(MovieModel movie) {
    return _favs.contains(movie);
  }

}