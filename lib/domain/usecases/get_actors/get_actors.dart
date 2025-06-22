import 'package:flix_id/domain/repositories/movie_repository.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../entity/actors/actor.dart';
import '../../entity/result/result.dart';

class GetActors implements Usecase<Result<List<Actor>>, GetActorParams> {
  final MovieRepository _movieRepository;
  GetActors({required MovieRepository movieRepository})
    : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorParams params) async {
    // TODO: implement call
    final actorListResult = await _movieRepository.getActors(
      movieId: params.movieId,
    );
    return switch (actorListResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final errorMessage) => Result.failed(errorMessage),
    };
  }
}
