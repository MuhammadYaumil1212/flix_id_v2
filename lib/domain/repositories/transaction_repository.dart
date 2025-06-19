import 'package:flix_id/domain/entity/transactions/transaction.dart';

import '../entity/result/result.dart';

abstract class TransactionRepository {
  Future<Result<Transaction>> createTransaction({
    required Transaction transaction,
  });
  Future<Result<List<Transaction>>> getUserTransaction({required String uid});
}
