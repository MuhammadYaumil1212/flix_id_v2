import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'poster_path') String? posterPath,
  }) = _Movie;

  factory Movie.fromJSON(Map<String, dynamic> json) => Movie(
        id: json['id'],
        title: json['title'],
        posterPath: json['poster_path'],
      );
}
