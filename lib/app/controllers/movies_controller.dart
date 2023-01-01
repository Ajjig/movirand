import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movirand/app/provider/api.dart';
import '../models/movie_model.dart';

class MoviesController extends GetxController {
  var data = <MovieModel>[].obs;

  @override
  void onInit() async {
    data.value = await api.discover();
    super.onInit();
  }

  @override
  void refresh() async {
    data.value = await api.discover();
    super.refresh();
  }
}
