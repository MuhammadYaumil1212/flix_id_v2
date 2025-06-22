import 'package:flix_id/domain/entity/actors/actor.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors.dart';
import 'package:flix_id/domain/usecases/get_actors/get_actors_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/entity/result/result.dart';
import '../../usecases/get_actors/get_actors_provider.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);
  final actorResult = await getActors(GetActorParams(movieId: movieId));

  return switch (actorResult) {
    Success(value: final actors) => actors,
    Failed(errorMessage: _) => const [],
  };
}
