import 'package:flix_id/domain/repositories/transaction_repository.dart';
import 'package:flix_id/domain/usecases/create_transactions/create_transaction_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../entity/result/result.dart';

class CreateTransaction
    implements Usecase<Result<void>, CreateTransactionParams> {
  final TransactionRepository _transactionRepository;
  CreateTransaction({required TransactionRepository transactionRepository})
    : _transactionRepository = transactionRepository;
  @override
  Future<Result<void>> call(CreateTransactionParams params) async {
    // TODO: implement call
    int transactionTime = DateTime.now().millisecondsSinceEpoch;
    final resultTransaction = await _transactionRepository.createTransaction(
      transaction: params.transaction.copyWith(
        transactionTime: transactionTime,
        id:
            params.transaction.id ??
            'flx-$transactionTime-${params.transaction.uid}',
      ),
    );
    return switch (resultTransaction) {
      Success(value: _) => Result.success(null),
      Failed(:final errorMessage) => Result.failed(errorMessage),
    };
  }
}
