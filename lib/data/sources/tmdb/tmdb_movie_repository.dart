import 'package:dio/dio.dart';
import 'package:flix_id/config/network/dio_client.dart';
import 'package:flix_id/domain/entity/actors/actor.dart';
import 'package:flix_id/domain/entity/movies/detail_movie.dart';
import 'package:flix_id/domain/entity/movies/movie.dart';
import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/repositories/movie_repository.dart';

class TmdbMovieRepository extends MovieRepository {
  final DioClient dio;
  TmdbMovieRepository({required this.dio});

  @override
  Future<Result<List<Actor>>> getActors({required int movieId}) async {
    // TODO: implement getActors
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/movie_id/credits?language=en-US",
      );
      final results = List<Map<String, dynamic>>.from(response.data['cast']);
      return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed("Failed to fetch actors: ${e.message}");
    }
  }

  @override
  Future<Result<DetailMovie>> getMovieDetails({required int movieId}) async {
    // TODO: implement getMovieDetails
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/$movieId?language=en-US",
      );
      return Result.success(DetailMovie.fromJSON(response.data));
    } catch (e) {
      return Result.failed("Failed to fetch movie details");
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) =>
      _getMovies(category: _MovieCategory.nowPlaying.toString(), page: page);

  @override
  Future<Result<List<Movie>>> upcomingMovies({int page = 1}) =>
      _getMovies(category: _MovieCategory.upcoming.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies({
    required String category,
    int page = 1,
  }) async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/$category/now_playing?language=en-US&page=$page",
      );
      final result = List<Map<String, dynamic>>.from(response.data['result']);
      return Result.success(result.map((e) => Movie.fromJSON(e)).toList());
    } catch (e) {
      return Result.failed("Failed to fetch movies");
    }
  }
}

enum _MovieCategory {
  nowPlaying("now_playing"),
  upcoming("upcoming");

  final String _instring;
  const _MovieCategory(String inString) : _instring = inString;

  @override
  String toString() => _instring;
}
