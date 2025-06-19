// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailMovie {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'backdrop_path') String? get backdropPath;@JsonKey(name: 'genres') List<String>? get genres;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'runtime') int? get runtime;@JsonKey(name: 'vote_average') double? get voteAverage;
/// Create a copy of DetailMovie
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailMovieCopyWith<DetailMovie> get copyWith => _$DetailMovieCopyWithImpl<DetailMovie>(this as DetailMovie, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailMovie&&(identical(other.id, id) || other.id == id)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}


@override
int get hashCode => Object.hash(runtimeType,id,backdropPath,const DeepCollectionEquality().hash(genres),posterPath,runtime,voteAverage);

@override
String toString() {
  return 'DetailMovie(id: $id, backdropPath: $backdropPath, genres: $genres, posterPath: $posterPath, runtime: $runtime, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class $DetailMovieCopyWith<$Res>  {
  factory $DetailMovieCopyWith(DetailMovie value, $Res Function(DetailMovie) _then) = _$DetailMovieCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'genres') List<String>? genres,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'runtime') int? runtime,@JsonKey(name: 'vote_average') double? voteAverage
});




}
/// @nodoc
class _$DetailMovieCopyWithImpl<$Res>
    implements $DetailMovieCopyWith<$Res> {
  _$DetailMovieCopyWithImpl(this._self, this._then);

  final DetailMovie _self;
  final $Res Function(DetailMovie) _then;

/// Create a copy of DetailMovie
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? backdropPath = freezed,Object? genres = freezed,Object? posterPath = freezed,Object? runtime = freezed,Object? voteAverage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc


class _DetailMovie implements DetailMovie {
  const _DetailMovie({@JsonKey(name: 'id') this.id, @JsonKey(name: 'backdrop_path') this.backdropPath, @JsonKey(name: 'genres') final  List<String>? genres, @JsonKey(name: 'poster_path') this.posterPath, @JsonKey(name: 'runtime') this.runtime, @JsonKey(name: 'vote_average') this.voteAverage}): _genres = genres;
  

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
 final  List<String>? _genres;
@override@JsonKey(name: 'genres') List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'runtime') final  int? runtime;
@override@JsonKey(name: 'vote_average') final  double? voteAverage;

/// Create a copy of DetailMovie
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailMovieCopyWith<_DetailMovie> get copyWith => __$DetailMovieCopyWithImpl<_DetailMovie>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailMovie&&(identical(other.id, id) || other.id == id)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage));
}


@override
int get hashCode => Object.hash(runtimeType,id,backdropPath,const DeepCollectionEquality().hash(_genres),posterPath,runtime,voteAverage);

@override
String toString() {
  return 'DetailMovie(id: $id, backdropPath: $backdropPath, genres: $genres, posterPath: $posterPath, runtime: $runtime, voteAverage: $voteAverage)';
}


}

/// @nodoc
abstract mixin class _$DetailMovieCopyWith<$Res> implements $DetailMovieCopyWith<$Res> {
  factory _$DetailMovieCopyWith(_DetailMovie value, $Res Function(_DetailMovie) _then) = __$DetailMovieCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'genres') List<String>? genres,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'runtime') int? runtime,@JsonKey(name: 'vote_average') double? voteAverage
});




}
/// @nodoc
class __$DetailMovieCopyWithImpl<$Res>
    implements _$DetailMovieCopyWith<$Res> {
  __$DetailMovieCopyWithImpl(this._self, this._then);

  final _DetailMovie _self;
  final $Res Function(_DetailMovie) _then;

/// Create a copy of DetailMovie
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? backdropPath = freezed,Object? genres = freezed,Object? posterPath = freezed,Object? runtime = freezed,Object? voteAverage = freezed,}) {
  return _then(_DetailMovie(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,voteAverage: freezed == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
