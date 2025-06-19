import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flix_id/domain/repositories/authentication_repository.dart';
import 'package:flix_id/domain/repositories/user_repository.dart';

import '../usecase.dart';
part 'login_params.dart';

class LoginUsecase implements Usecase<Result<User>, LoginParams> {
  final AuthenticationRepository authentication;
  final UserRepository userRepository;

  LoginUsecase({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    // TODO: implement call
    final idUser = await authentication.login(
      email: params.email,
      password: params.password,
    );
    if (idUser is Success) {
      final userResult = await userRepository.getUser(uid: idUser.resultValue!);
      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final errorMessage) => Result.failed(errorMessage),
      };
    } else {
      return Result.failed(idUser.errorMessage ?? "Something gone wrong");
    }
  }
}
