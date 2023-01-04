import 'dart:convert';
import '../data/CONSTANTS.dart';

class MovieModel {
  final String id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<String> genres;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
  });

  factory MovieModel.fromJson(dynamic json) {
    List<String> genres = [];
    for (var i = 0; i < json['genre_ids'].length; i++) {
      if (MOVIE_GENRES.containsKey(json['genre_ids'][i]!)) {
        genres.add(MOVIE_GENRES[json['genre_ids'][i]]!);
      }
    }
    return MovieModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      posterPath: json['poster_path'].toString(),
      backdropPath: json['backdrop_path'].toString(),
      overview: json['overview'].toString(),
      releaseDate: json['release_date'].toString(),
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'].toInt(),
      genres: genres,
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'genres': genres,
    });
  }
}
