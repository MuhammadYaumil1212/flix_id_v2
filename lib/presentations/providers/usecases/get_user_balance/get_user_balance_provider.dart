import 'package:flix_id/domain/usecases/get_user_balance/get_user_balance.dart';
import '../../repositories/user/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_balance_provider.g.dart';

@riverpod
GetUserBalance getUserBalance(ref) =>
    GetUserBalance(userRepository: ref.watch(userRepositoryProvider));
