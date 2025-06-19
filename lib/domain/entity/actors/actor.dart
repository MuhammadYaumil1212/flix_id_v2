import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';

@freezed
abstract class Actor with _$Actor {
  const factory Actor({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'original_name') required String originalName,
    @JsonKey(name: 'popularity') double? popularity,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _Actor;

  factory Actor.fromJSON(Map<String, dynamic> json) => Actor(
      name: json['name'],
      originalName: json['original_name'],
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path']);
}
