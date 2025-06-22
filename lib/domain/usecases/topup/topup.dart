import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/transactions/transaction.dart';
import 'package:flix_id/domain/repositories/transaction_repository.dart';
import 'package:flix_id/domain/repositories/user_repository.dart';
import 'package:flix_id/domain/usecases/create_transactions/create_transaction.dart';
import 'package:flix_id/domain/usecases/create_transactions/create_transaction_params.dart';
import 'package:flix_id/domain/usecases/topup/topup_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

class Topup implements Usecase<Result<void>, TopupParams> {
  final TransactionRepository _transactionRepository;
  Topup({
    required UserRepository topupRepository,
    required TransactionRepository transactionRepository,
  }) : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopupParams params) async {
    // TODO: implement call
    CreateTransaction createTransaction = CreateTransaction(
      transactionRepository: _transactionRepository,
    );
    int transactionTime = DateTime.now().millisecondsSinceEpoch;
    final createTransactionResult = await createTransaction(
      CreateTransactionParams(
        transaction: Transaction(
          uid: params.userId,
          title: "Top Up",
          adminFee: 0,
          total: -params.amount,
          transactionTime: transactionTime,
          id: 'flxtp-$transactionTime-${params.userId}',
        ),
      ),
    );
    return switch (createTransactionResult) {
      Success(value: _) => const Result.success(null),
      Failed() => const Result.failed("Failed top up"),
    };
  }
}
