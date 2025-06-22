import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flix_id/domain/repositories/authentication_repository.dart';
import 'package:flix_id/domain/repositories/user_repository.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetLoggedInUser implements Usecase<Result<User>, void> {
  final AuthenticationRepository _authentication;
  final UserRepository _userRepository;

  GetLoggedInUser({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  }) : _authentication = authenticationRepository,
       _userRepository = userRepository;
  @override
  Future<Result<User>> call(void params) async {
    // TODO: implement call
    String? loggedId = _authentication.getLoggedInUserId();
    if (loggedId == null) {
      return Result.failed("No user is logged in");
    } else {
      final userRepoResult = await _userRepository.getUser(uid: loggedId);
      if (userRepoResult.isSuccess) {
        return Result.success(userRepoResult.resultValue!);
      } else {
        return Result.failed(
          userRepoResult.errorMessage ?? "Error fetching user",
        );
      }
    }
  }
}
