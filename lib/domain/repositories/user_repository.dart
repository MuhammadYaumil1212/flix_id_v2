import 'dart:io';

import 'package:flix_id/domain/entity/result/result.dart';

import '../entity/users/user.dart';

abstract class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String name,
    required String email,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<int>> getUserbalance({required String uid});
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  });
  Future<Result<User>> uploadProfilePicture({
    required User user,
    required File imageFile,
  });
}
