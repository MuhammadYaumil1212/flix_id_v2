import 'package:flix_id/domain/usecases/topup/topup.dart';
import 'package:flix_id/presentations/providers/repositories/transactions/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'topup_provider.g.dart';

@riverpod
Topup topup(ref) =>
    Topup(transactionRepository: ref.watch(transactionRepositoryProvider));
