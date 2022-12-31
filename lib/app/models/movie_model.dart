class MovieModel {
  final String id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(dynamic json) {
    return MovieModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      posterPath: json['poster_path'].toString(),
      backdropPath: json['backdrop_path'].toString(),
      overview: json['overview'].toString(),
      releaseDate: json['release_date'].toString(),
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'].toInt(),
    );
  }
}