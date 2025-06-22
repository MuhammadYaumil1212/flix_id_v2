import 'package:flix_id/domain/entity/movies/movie.dart';
import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/usecases/get_move_list/get_move_list_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../repositories/movie_repository.dart';

class GetMovieList implements Usecase<Result<List<Movie>>, GetMovieListParams> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> call(GetMovieListParams params) async {
    final movieResult = switch (params.category) {
      MovieListCategory.nowPlaying => await _movieRepository.getNowPlaying(
        page: params.page,
      ),
      MovieListCategory.upcoming => await _movieRepository.upcomingMovies(
        page: params.page,
      ),
    };

    return switch (movieResult) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final errorMessage) => Result.failed(errorMessage),
    };
  }
}
