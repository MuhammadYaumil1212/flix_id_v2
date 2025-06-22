import 'package:flix_id/domain/usecases/create_transactions/create_transaction.dart';
import 'package:flix_id/presentations/providers/repositories/transactions/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transactions_provider.g.dart';

@riverpod
CreateTransaction createTransaction(ref) => CreateTransaction(
  transactionRepository: ref.watch(transactionRepositoryProvider),
);
