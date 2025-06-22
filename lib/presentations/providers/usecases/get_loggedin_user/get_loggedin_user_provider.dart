import 'package:flix_id/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:flix_id/presentations/providers/repositories/user/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repositories/authentications/authentications_provider.dart';

part 'get_loggedin_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(ref) => GetLoggedInUser(
  userRepository: ref.watch(userRepositoryProvider),
  authenticationRepository: ref.watch(authenticationsProvider),
);
