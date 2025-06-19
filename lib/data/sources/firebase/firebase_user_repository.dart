import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flix_id/domain/repositories/user_repository.dart';
import 'package:path/path.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firestore})
    : _firebaseFirestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<User>> createUser({
    required String uid,
    required String name,
    required String email,
    String? photoUrl,
    int balance = 0,
  }) async {
    // TODO: implement createUser
    CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('Users');
    await users.doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl ?? '',
      'balance': balance,
    });

    DocumentSnapshot<Map<String, dynamic>> result = await users.doc(uid).get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed("User creation failed");
    }
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    // TODO: implement getUser
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("Users/$uid}");
    DocumentSnapshot<Map<String, dynamic>> result = await documentReference
        .get();
    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed("User not found");
    }
  }

  @override
  Future<Result<int>> getUserbalance({required String uid}) async {
    // TODO: implement getUserbalance
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc("Users/$uid");
      DocumentSnapshot<Map<String, dynamic>> result = await documentReference
          .get();
      if (result.exists) {
        return Result.success(result.data()!['balance']);
      } else {
        return Result.failed("Balance not found");
      }
    } on FirebaseException catch (e) {
      return Result.failed(
        e.message ?? "Exception error : Failed to get user balance",
      );
    }
  }

  @override
  Future<Result<User>> updateUser({required User user}) async {
    // TODO: implement updateUser
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc("Users/${user.uid}");
      DocumentSnapshot<Map<String, dynamic>> result = await documentReference
          .get();
      if (result.exists) {
        User updatedUser = User.fromJson(result.data()!);
        if (updatedUser == user) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed("Failed to update user data");
        }
      } else {
        return const Result.failed("Failed to update user data");
      }
    } on FirebaseException catch (e) {
      return Result.failed(
        e.message ?? "Exception error : Failed to update user data",
      );
    }
  }

  @override
  Future<Result<User>> updateUserBalance({
    required String uid,
    required int balance,
  }) async {
    // TODO: implement updateUserBalance
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc("Users/$uid");
    DocumentSnapshot<Map<String, dynamic>> result = await documentReference
        .get();
    if (result.exists) {
      await documentReference.update({'balance': balance});
      DocumentSnapshot<Map<String, dynamic>> updateResult =
          await documentReference.get();
      if (updateResult.exists) {
        User updateUser = User.fromJson(updateResult.data()!);
        if (updateUser.balance == balance) {
          return Result.success(updateUser);
        } else {
          return Result.failed("Failed to update user balance");
        }
      } else {
        return Result.failed("Failed to retrieve updated user balance");
      }
    } else {
      return Result.failed("User not found");
    }
  }

  @override
  Future<Result<User>> uploadProfilePicture({
    required User user,
    required File imageFile,
  }) async {
    // TODO: implement uploadProfilePicture
    final fileName = basename(imageFile.path);
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    try {
      await reference.putFile(imageFile);
      String downloadUrl = await reference.getDownloadURL();
      final updateResult = await updateUser(
        user: user.copyWith(photoUrl: downloadUrl),
      );
      if (updateResult.isSuccess) {
        return Result.success(updateResult.resultValue!);
      } else {
        return Result.failed(updateResult.errorMessage!);
      }
    } catch (e) {
      return Result.failed("Failed to upload profile picture: ${e.toString()}");
    }
  }
}
