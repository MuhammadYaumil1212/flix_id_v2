import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_movie.freezed.dart';

@freezed
abstract class DetailMovie with _$DetailMovie {
  const factory DetailMovie({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genres') List<String>? genres,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'runtime') int? runtime,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _DetailMovie;

  factory DetailMovie.fromJSON(Map<String, dynamic> json) => DetailMovie(
        id: json['id'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'].toDouble(),
        backdropPath: json['backdrop_path'],
        genres: List<String>.from(
          json['genres']?.map((x) => x['name'] ?? '') ?? [],
        ),
        runtime: json['runtime'],
      );
}
