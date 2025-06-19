// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transaction {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'uid') String get uid;@JsonKey(name: 'transactionTime') int? get transactionTime;@JsonKey(name: 'transactionImage') String? get transactionImage;@JsonKey(name: 'title') String get title;@JsonKey(name: 'seats') List<String> get seats;@JsonKey(name: 'theaterName') String? get theaterName;@JsonKey(name: 'watchingTime') String? get watchingTime;@JsonKey(name: 'ticketAmount') int? get ticketAmount;@JsonKey(name: 'ticketPrice') int? get ticketPrice;@JsonKey(name: 'adminFee') int? get adminFee;@JsonKey(name: 'total') int? get total;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.transactionTime, transactionTime) || other.transactionTime == transactionTime)&&(identical(other.transactionImage, transactionImage) || other.transactionImage == transactionImage)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.seats, seats)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.watchingTime, watchingTime) || other.watchingTime == watchingTime)&&(identical(other.ticketAmount, ticketAmount) || other.ticketAmount == ticketAmount)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.adminFee, adminFee) || other.adminFee == adminFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,transactionTime,transactionImage,title,const DeepCollectionEquality().hash(seats),theaterName,watchingTime,ticketAmount,ticketPrice,adminFee,total);

@override
String toString() {
  return 'Transaction(id: $id, uid: $uid, transactionTime: $transactionTime, transactionImage: $transactionImage, title: $title, seats: $seats, theaterName: $theaterName, watchingTime: $watchingTime, ticketAmount: $ticketAmount, ticketPrice: $ticketPrice, adminFee: $adminFee, total: $total)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'transactionTime') int? transactionTime,@JsonKey(name: 'transactionImage') String? transactionImage,@JsonKey(name: 'title') String title,@JsonKey(name: 'seats') List<String> seats,@JsonKey(name: 'theaterName') String? theaterName,@JsonKey(name: 'watchingTime') String? watchingTime,@JsonKey(name: 'ticketAmount') int? ticketAmount,@JsonKey(name: 'ticketPrice') int? ticketPrice,@JsonKey(name: 'adminFee') int? adminFee,@JsonKey(name: 'total') int? total
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = null,Object? transactionTime = freezed,Object? transactionImage = freezed,Object? title = null,Object? seats = null,Object? theaterName = freezed,Object? watchingTime = freezed,Object? ticketAmount = freezed,Object? ticketPrice = freezed,Object? adminFee = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,transactionTime: freezed == transactionTime ? _self.transactionTime : transactionTime // ignore: cast_nullable_to_non_nullable
as int?,transactionImage: freezed == transactionImage ? _self.transactionImage : transactionImage // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as List<String>,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,watchingTime: freezed == watchingTime ? _self.watchingTime : watchingTime // ignore: cast_nullable_to_non_nullable
as String?,ticketAmount: freezed == ticketAmount ? _self.ticketAmount : ticketAmount // ignore: cast_nullable_to_non_nullable
as int?,ticketPrice: freezed == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as int?,adminFee: freezed == adminFee ? _self.adminFee : adminFee // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Transaction implements Transaction {
  const _Transaction({@JsonKey(name: 'id') this.id, @JsonKey(name: 'uid') required this.uid, @JsonKey(name: 'transactionTime') this.transactionTime, @JsonKey(name: 'transactionImage') this.transactionImage, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'seats') final  List<String> seats = const [], @JsonKey(name: 'theaterName') this.theaterName, @JsonKey(name: 'watchingTime') this.watchingTime, @JsonKey(name: 'ticketAmount') this.ticketAmount, @JsonKey(name: 'ticketPrice') this.ticketPrice, @JsonKey(name: 'adminFee') this.adminFee, @JsonKey(name: 'total') this.total}): _seats = seats;
  factory _Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'uid') final  String uid;
@override@JsonKey(name: 'transactionTime') final  int? transactionTime;
@override@JsonKey(name: 'transactionImage') final  String? transactionImage;
@override@JsonKey(name: 'title') final  String title;
 final  List<String> _seats;
@override@JsonKey(name: 'seats') List<String> get seats {
  if (_seats is EqualUnmodifiableListView) return _seats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seats);
}

@override@JsonKey(name: 'theaterName') final  String? theaterName;
@override@JsonKey(name: 'watchingTime') final  String? watchingTime;
@override@JsonKey(name: 'ticketAmount') final  int? ticketAmount;
@override@JsonKey(name: 'ticketPrice') final  int? ticketPrice;
@override@JsonKey(name: 'adminFee') final  int? adminFee;
@override@JsonKey(name: 'total') final  int? total;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.transactionTime, transactionTime) || other.transactionTime == transactionTime)&&(identical(other.transactionImage, transactionImage) || other.transactionImage == transactionImage)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._seats, _seats)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.watchingTime, watchingTime) || other.watchingTime == watchingTime)&&(identical(other.ticketAmount, ticketAmount) || other.ticketAmount == ticketAmount)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.adminFee, adminFee) || other.adminFee == adminFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,transactionTime,transactionImage,title,const DeepCollectionEquality().hash(_seats),theaterName,watchingTime,ticketAmount,ticketPrice,adminFee,total);

@override
String toString() {
  return 'Transaction(id: $id, uid: $uid, transactionTime: $transactionTime, transactionImage: $transactionImage, title: $title, seats: $seats, theaterName: $theaterName, watchingTime: $watchingTime, ticketAmount: $ticketAmount, ticketPrice: $ticketPrice, adminFee: $adminFee, total: $total)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'transactionTime') int? transactionTime,@JsonKey(name: 'transactionImage') String? transactionImage,@JsonKey(name: 'title') String title,@JsonKey(name: 'seats') List<String> seats,@JsonKey(name: 'theaterName') String? theaterName,@JsonKey(name: 'watchingTime') String? watchingTime,@JsonKey(name: 'ticketAmount') int? ticketAmount,@JsonKey(name: 'ticketPrice') int? ticketPrice,@JsonKey(name: 'adminFee') int? adminFee,@JsonKey(name: 'total') int? total
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = null,Object? transactionTime = freezed,Object? transactionImage = freezed,Object? title = null,Object? seats = null,Object? theaterName = freezed,Object? watchingTime = freezed,Object? ticketAmount = freezed,Object? ticketPrice = freezed,Object? adminFee = freezed,Object? total = freezed,}) {
  return _then(_Transaction(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,transactionTime: freezed == transactionTime ? _self.transactionTime : transactionTime // ignore: cast_nullable_to_non_nullable
as int?,transactionImage: freezed == transactionImage ? _self.transactionImage : transactionImage // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self._seats : seats // ignore: cast_nullable_to_non_nullable
as List<String>,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,watchingTime: freezed == watchingTime ? _self.watchingTime : watchingTime // ignore: cast_nullable_to_non_nullable
as String?,ticketAmount: freezed == ticketAmount ? _self.ticketAmount : ticketAmount // ignore: cast_nullable_to_non_nullable
as int?,ticketPrice: freezed == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as int?,adminFee: freezed == adminFee ? _self.adminFee : adminFee // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
