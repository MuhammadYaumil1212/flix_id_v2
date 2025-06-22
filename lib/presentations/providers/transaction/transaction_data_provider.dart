import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/transactions/transaction.dart';
import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transaction.dart';
import 'package:flix_id/domain/usecases/get_transactions/get_transaction_params.dart';
import 'package:flix_id/presentations/providers/usecases/get_transactions/get_transactions_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../user/user_data_provider.dart';

part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<Transaction>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;
    if (user != null) {
      state = const AsyncLoading();
      GetTransactions transactions = ref.read(getTransactionsProvider);
      var result = getTransactions(GetTransactionParams(uid: user.uid));
      if (result case Success(value: final transactions)) {
        return transactions;
      }
    }
    return const [];
  }

  Future<void> refreshTransactionData() async {
    User? user = ref.read(userDataProvider).valueOrNull;
    if (user != null) {
      state = const AsyncLoading();
      GetTransactions getTransactions = ref.read(getTransactionsProvider);
      var result = await getTransactions(GetTransactionParams(uid: user.uid));
      switch (result) {
        case Success(value: final resultValue):
          state = AsyncData(resultValue);
        case Failed(:final errorMessage):
          state = AsyncError(FlutterError(errorMessage), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }
}
