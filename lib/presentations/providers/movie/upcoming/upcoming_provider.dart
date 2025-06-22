import 'package:flix_id/domain/entity/movies/movie.dart';
import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/usecases/get_move_list/get_move_list_params.dart';
import 'package:flix_id/domain/usecases/get_move_list/get_movie_list.dart';
import 'package:flix_id/presentations/providers/usecases/get_movie_list/get_movie_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_provider.g.dart';

@Riverpod(keepAlive: true)
class Upcoming extends _$Upcoming {
  @override
  FutureOr<List<Movie>> build() => const [];
  Future<void> getMovies({int page = 1}) async {
    state = const AsyncLoading();
    GetMovieList getMovieList = ref.read(getMovieListProvider);
    final result = await getMovieList(
      GetMovieListParams(category: MovieListCategory.upcoming),
    );
    switch (result) {
      case Success(value: final movies):
        state = AsyncData(movies);
      case Failed():
        state = const AsyncData([]);
    }
  }
}
