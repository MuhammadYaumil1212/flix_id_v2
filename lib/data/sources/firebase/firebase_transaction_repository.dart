import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:flix_id/data/sources/firebase/firebase_user_repository.dart';
import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/transactions/transaction.dart';
import 'package:flix_id/domain/repositories/transaction_repository.dart';

class FirebaseTransactionRepository extends TransactionRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;
  FirebaseTransactionRepository({
    firestore.FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore =
           firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<Transaction>> createTransaction({
    required Transaction transaction,
  }) async {
    // TODO: implement createTransaction
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('Transactions');
    try {
      final balanceResult = await FirebaseUserRepository().getUserbalance(
        uid: transaction.uid,
      );
      if (balanceResult.isSuccess) {
        int previousBalance = balanceResult.resultValue!;
        if (previousBalance - transaction.total! >= 0) {
          await transactions.doc(transaction.id).set(transaction.toJson());
          final result = await transactions.doc(transaction.id).get();
          if (result.exists) {
            await FirebaseUserRepository().updateUserBalance(
              uid: transaction.uid,
              balance: previousBalance - transaction.total!,
            );
            return Result.success(Transaction.fromJson(result.data()!));
          } else {
            return const Result.failed("Transaction creation failed");
          }
        } else {
          return const Result.failed("insufficent balance");
        }
      } else {
        return Result.failed("Failed to retrieve user balance");
      }
    } catch (e) {
      return Result.failed("Failed to create transaction: $e");
    }
  }

  @override
  Future<Result<List<Transaction>>> getUserTransaction({
    required String uid,
  }) async {
    // TODO: implement getUserTransaction
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('Transactions');
    try {
      final result = await transactions.where('uid', isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {
        return Result.success(
          result.docs
              .map((element) => Transaction.fromJson(element.data()))
              .toList(),
        );
      } else {
        return Result.success([]);
      }
    } catch (e) {
      return Result.failed("Failed to retrieve user transactions: $e");
    }
  }
}
