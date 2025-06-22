import 'package:flix_id/data/sources/firebase/firebase_transaction_repository.dart';
import 'package:flix_id/domain/repositories/transaction_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(ref) =>
    FirebaseTransactionRepository();
