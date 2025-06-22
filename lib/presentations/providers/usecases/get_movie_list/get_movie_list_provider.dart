import 'package:flix_id/domain/usecases/get_move_list/get_movie_list.dart';
import 'package:flix_id/presentations/providers/repositories/movies/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie_list_provider.g.dart';

@riverpod
GetMovieList getMovieList(ref) =>
    GetMovieList(movieRepository: ref.watch(movieRepositoryProvider));
