import 'package:flix_id/domain/repositories/authentication_repository.dart';

import '../../entity/result/result.dart';
import '../usecase.dart';

class Logout implements Usecase<Result<void>, void> {
  final AuthenticationRepository _authenticationRepository;
  Logout({required authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  @override
  Future<Result<void>> call(void params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
