import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flix_id/domain/repositories/authentication_repository.dart';
import 'package:flix_id/domain/repositories/user_repository.dart';
import 'package:flix_id/domain/usecases/register/register_params.dart';

import '../usecase.dart';

class Register implements Usecase<Result<User>, RegisterParams> {
  final AuthenticationRepository _authentication;
  final UserRepository _userRepository;
  Register({required authenticationRepository, required userRepository})
    : _authentication = authenticationRepository,
      _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParams params) async {
    // TODO: implement call
    final uid = await _authentication.register(
      email: params.email,
      password: params.password,
    );
    if (uid.isSuccess) {
      final userResult = await _userRepository.createUser(
        uid: uid.resultValue!,
        name: params.name,
        email: params.email,
        photoUrl: params.photoUrl,
      );
      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage ?? "Error creating user");
      }
    } else {
      return Result.failed(uid.errorMessage ?? "Error registering user");
    }
  }
}
