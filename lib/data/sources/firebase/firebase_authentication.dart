import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class FirebaseAuthentication extends AuthenticationRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({firebase_auth.FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  String? getLoggedInUserId() => _firebaseAuth.currentUser?.uid;

  @override
  Future<Result<String>> login({
    required String email,
    required String password,
  }) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("user credential ${userCredential.user!.uid}");
      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseException catch (e) {
      return Result.failed(e.message ?? "Something gone wrong");
    }
  }

  @override
  Future<Result<void>> logout() async {
    // TODO: implement logout
    await _firebaseAuth.signOut();
    if (_firebaseAuth.currentUser == null) {
      return const Result.success(null);
    } else {
      return const Result.failed("Logout Failed");
    }
  }

  @override
  Future<Result<String>> register({
    required String email,
    required String password,
  }) async {
    // TODO: implement register
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseException catch (e) {
      return Result.failed('${e.message}');
    }
  }
}
