import 'package:flix_id/domain/entity/actors/actor.dart';
import 'package:flix_id/domain/entity/movies/detail_movie.dart';

import '../entity/movies/movie.dart';
import '../entity/result/result.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>>> upcomingMovies({required int page});
  Future<Result<List<Movie>>> getNowPlaying({required int page});
  Future<Result<List<DetailMovie>>> getMovieDetails({required int movieId});
  Future<Result<List<Actor>>> getActors({required int movieId});
}
