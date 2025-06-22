import 'package:flix_id/domain/usecases/upload_profile_picture/upload_profile_picture.dart';
import 'package:flix_id/presentations/providers/repositories/user/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_profile_picture_provider.g.dart';

@riverpod
UploadProfilePicture uploadProfilePicture(ref) =>
    UploadProfilePicture(userRepository: ref.watch(userRepositoryProvider));
