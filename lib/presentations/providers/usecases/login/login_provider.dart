import 'package:flix_id/domain/usecases/login/login_usecase.dart';
import 'package:flix_id/presentations/providers/repositories/authentications/authentications_provider.dart';
import 'package:flix_id/presentations/providers/repositories/user/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
LoginUsecase loginUsecase(ref) => LoginUsecase(
      authentication: ref.watch(authenticationsProvider),
      userRepository: ref.watch(userRepositoryProvider),
    );
