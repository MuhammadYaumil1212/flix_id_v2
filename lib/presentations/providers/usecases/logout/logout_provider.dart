import 'package:flix_id/domain/usecases/logout/logout.dart';
import '../../repositories/authentications/authentications_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(ref) =>
    Logout(authenticationRepository: ref.watch(authenticationsProvider));
