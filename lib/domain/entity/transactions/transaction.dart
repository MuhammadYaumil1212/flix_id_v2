import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'transactionTime') int? transactionTime,
    @JsonKey(name: 'transactionImage') String? transactionImage,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'seats') @Default([]) List<String> seats,
    @JsonKey(name: 'theaterName') String? theaterName,
    @JsonKey(name: 'watchingTime') String? watchingTime,
    @JsonKey(name: 'ticketAmount') int? ticketAmount,
    @JsonKey(name: 'ticketPrice') int? ticketPrice,
    @JsonKey(name: 'adminFee') int? adminFee,
    @JsonKey(name: 'total') int? total,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json) =>
      _$TransactionFromJson(json);
}
