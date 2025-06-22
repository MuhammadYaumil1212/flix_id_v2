import 'package:flix_id/domain/entity/movies/detail_movie.dart';
import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/usecases/get_movie_detail/get_movie_detail.dart';
import 'package:flix_id/domain/usecases/get_movie_detail/get_movie_detail_params.dart';
import 'package:flix_id/presentations/providers/usecases/get_movie_detail/get_movie_detail_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/entity/movies/movie.dart';

part 'movie_detail_provider.g.dart';

@riverpod
Future<DetailMovie?> movieDetail(ref, {required Movie movie}) async {
  GetMovieDetail getMovieDetail = ref.read(getMovieDetailProvider);
  var movieDetailResult = await getMovieDetail(
    GetMovieDetailParams(movie: movie),
  );
  return switch (movieDetailResult) {
    Success(value: final movieDetail) => movieDetail,
    Failed(errorMessage: _) => null,
  };
}
