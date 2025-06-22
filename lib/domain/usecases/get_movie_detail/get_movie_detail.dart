import 'package:flix_id/domain/entity/movies/detail_movie.dart';
import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/repositories/movie_repository.dart';
import 'package:flix_id/domain/usecases/get_movie_detail/get_movie_detail_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetMovieDetail
    implements Usecase<Result<DetailMovie>, GetMovieDetailParams> {
  final MovieRepository _movieRepository;
  GetMovieDetail({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<DetailMovie>> call(GetMovieDetailParams params) async {
    // TODO: implement call
    final movieDetailResult = await _movieRepository.getMovieDetails(
      movieId: params.movie.id,
    );
    return switch (movieDetailResult) {
      Success(value: final movieDetail) => Result.success(movieDetail),
      Failed(:final errorMessage) => Result.failed(errorMessage),
    };
  }
}
