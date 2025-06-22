import 'package:flix_id/data/sources/tmdb/tmdb_movie_repository.dart';
import 'package:flix_id/domain/repositories/movie_repository.dart';
import 'package:flix_id/presentations/providers/repositories/dio_client/dio_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(ref) =>
    TmdbMovieRepository(dio: ref.watch(dioClientProvider));
