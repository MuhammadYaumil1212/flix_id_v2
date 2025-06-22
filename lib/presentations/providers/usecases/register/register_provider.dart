import 'package:flix_id/domain/usecases/register/register.dart';
import 'package:flix_id/presentations/providers/repositories/authentications/authentications_provider.dart';
import 'package:flix_id/presentations/providers/repositories/user/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(ref) => Register(
  authenticationRepository: ref.watch(authenticationsProvider),
  userRepository: ref.watch(userRepositoryProvider),
);
