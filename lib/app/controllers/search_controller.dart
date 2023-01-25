import 'package:get/get.dart';
import '../models/movie_model.dart';
import '../provider/api.dart';

class SearchController extends GetxController {
  final _data = <MovieModel>[].obs;

  List<MovieModel> get data => _data;
  int get length => _data.length;

  @override
  void onInit() async {
    super.onInit();
    _data.value = [];
  }

  void search(String query) async {
    _data.value = await api.search(query.replaceAll(' ', '+'));
  }
}
