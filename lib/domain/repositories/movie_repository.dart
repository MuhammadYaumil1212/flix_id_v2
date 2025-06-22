import 'package:flix_id/domain/entity/actors/actor.dart';
import 'package:flix_id/domain/entity/movies/detail_movie.dart';

import '../entity/movies/movie.dart';
import '../entity/result/result.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>>> upcomingMovies({int page = 1});
  Future<Result<List<Movie>>> getNowPlaying({int page = 1});
  Future<Result<DetailMovie>> getMovieDetails({required int movieId});
  Future<Result<List<Actor>>> getActors({required int movieId});
}
