import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/transactions/transaction.dart';
import 'package:flix_id/domain/repositories/transaction_repository.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transaction_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class GetTransactions
    implements Usecase<Result<List<Transaction>>, GetTransactionParams> {
  final TransactionRepository _transactionRepository;
  GetTransactions({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionParams params) async {
    // TODO: implement call
    final transactionList = await _transactionRepository.getUserTransaction(
      uid: params.uid,
    );
    return switch (transactionList) {
      Success(value: final transaction) => Result.success(transaction),
      Failed(:final errorMessage) => Result.failed(errorMessage),
    };
  }
}
