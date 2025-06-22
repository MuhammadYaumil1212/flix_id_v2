import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flix_id/domain/usecases/upload_profile_picture/Upload_profile_picture_params.dart';
import 'package:flix_id/domain/usecases/usecase.dart';

import '../../repositories/user_repository.dart';

class UploadProfilePicture
    implements Usecase<Result<User>, UploadProfilePictureParams> {
  final UserRepository _userRepository;
  UploadProfilePicture({required UserRepository userRepository})
    : _userRepository = userRepository;
  @override
  Future<Result<User>> call(UploadProfilePictureParams params) =>
      _userRepository.uploadProfilePicture(
        user: params.user,
        imageFile: params.imageFile,
      );
}
