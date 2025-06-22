import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/usecases/get_user_balance/get_user_balance_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../repositories/user_repository.dart';

class GetUserBalance implements Usecase<Result<int>, GetUserBalanceParams> {
  final UserRepository _userRepository;
  GetUserBalance({required UserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Result<int>> call(GetUserBalanceParams params) =>
      _userRepository.getUserbalance(uid: params.userId);
}
