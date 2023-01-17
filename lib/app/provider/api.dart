import 'package:movirand/app/models/actors_model.dart';

import '../../private.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import '../models/movie_model.dart';

class Api {
  Future<List<MovieModel>> discover() async {
    List<MovieModel> movies = [];

    http.Response response = await http.get(Uri.https(
        'api.themoviedb.org', '/3/discover/movie', {
      'api_key': apiKey,
      'page': (Random().nextInt(499) + 1).toString()
    })); // apiKey contains a private api key..
    // get yours here => https://developers.themoviedb.org/3/getting-started/introduction

    dynamic jsonData = jsonDecode(response.body)['results'];
    for (var i = 0; i < jsonData.length; i++) {
      MovieModel movie = MovieModel.fromJson(jsonData[i]);
      movies.add(movie);
    }
    return movies;
  }

  Future<List<ActorsModel>> getActors(MovieModel data) async {
    List<ActorsModel> actors = [];
    http.Response response = await http.get(Uri.https('api.themoviedb.org',
        "/3/movie/" + data.id + '/credits', {'api_key': apiKey}));

    dynamic jsonData = jsonDecode(response.body)['cast'];
    for (var i = 0; i < jsonData.length; i++) {
      ActorsModel actor = ActorsModel.fromJson(jsonData[i]);
      actors.add(actor);
    }
    return actors;
  }
}

Api api = Api();
