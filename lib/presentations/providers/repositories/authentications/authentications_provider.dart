import 'package:flix_id/data/sources/firebase/firebase_authentication.dart';
import 'package:flix_id/domain/repositories/authentication_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'authentications_provider.g.dart';

@riverpod
AuthenticationRepository authentications(ref) => FirebaseAuthentication();
