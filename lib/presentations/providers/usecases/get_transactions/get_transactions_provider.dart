import 'package:flix_id/domain/usecases/get_transactions/get_transaction.dart';
import 'package:flix_id/presentations/providers/repositories/transactions/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_transactions_provider.g.dart';

@riverpod
GetTransactions getTransactions(ref) => GetTransactions(
  transactionRepository: ref.watch(transactionRepositoryProvider),
);
