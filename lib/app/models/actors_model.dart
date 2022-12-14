import '../data/CONSTANTS.dart';

class ActorsModel {
  final String name;
  final String profilePath;
  final String character;

  ActorsModel({
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory ActorsModel.fromJson(dynamic json) {
    return ActorsModel(
      name: json['name'] ?? '_______',
      profilePath: json['profile_path'] == null
          ? DEFAUL_PROFILE_IMAGE
          : PROFILE_BASE_URL + json['profile_path'],
      character: json['character'] ?? '_______',
    );
  }
}