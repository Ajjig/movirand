import 'package:get/get.dart';
import 'package:movirand/app/provider/api.dart';
import '../models/movie_model.dart';

class MoviesController extends GetxController {
  var data = <MovieModel>[].obs;
  int get crossSize => Get.width > 800
      ? 4
      : Get.width > 600
          ? 3
          : 2;
  int get length => data.length;

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
}
