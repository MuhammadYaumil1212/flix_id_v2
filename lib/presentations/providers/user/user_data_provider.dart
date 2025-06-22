import 'dart:io';

import 'package:flix_id/domain/entity/result/result.dart';
import 'package:flix_id/domain/entity/users/user.dart';
import 'package:flix_id/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:flix_id/domain/usecases/login/login_usecase.dart';
import 'package:flix_id/domain/usecases/register/register_params.dart';
import 'package:flix_id/domain/usecases/topup/topup.dart';
import 'package:flix_id/domain/usecases/topup/topup_params.dart';
import 'package:flix_id/domain/usecases/upload_profile_picture/Upload_profile_picture_params.dart';
import 'package:flix_id/domain/usecases/upload_profile_picture/upload_profile_picture.dart';
import 'package:flix_id/presentations/providers/movie/now_playing/now_playing_provider.dart';
import 'package:flix_id/presentations/providers/movie/upcoming/upcoming_provider.dart';
import 'package:flix_id/presentations/providers/transaction/transaction_data_provider.dart';
import 'package:flix_id/presentations/providers/usecases/get_loggedin_user/get_loggedin_user_provider.dart';
import 'package:flix_id/presentations/providers/usecases/login/login_provider.dart';
import 'package:flix_id/presentations/providers/usecases/logout/logout_provider.dart';
import 'package:flix_id/presentations/providers/usecases/register/register_provider.dart';
import 'package:flix_id/presentations/providers/usecases/topup/topup_provider.dart';
import 'package:flix_id/presentations/providers/usecases/upload_profile_picture/upload_profile_picture_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecases/register/register.dart';

part 'user_data_provider.g.dart';

@Riverpod()
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    final GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var userResult = await getLoggedInUser(null);
    switch (userResult) {
      case Success(value: final user):
        _getMovies();
        return user;
      case Failed(errorMessage: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    LoginUsecase login = ref.read(loginUsecaseProvider);
    final result = await login(LoginParams(email: email, password: password));
    switch (result) {
      case Success(value: final user):
        _getMovies();
        state = AsyncData(user);
      case Failed(:final errorMessage):
        state = AsyncError(FlutterError(errorMessage), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    String? photoUrl,
  }) async {
    state = const AsyncLoading();
    Register register = ref.read(registerProvider);
    var result = await register(
      RegisterParams(name: name, email: email, password: password),
    );
    switch (result) {
      case Success(value: final user):
        _getMovies();
        state = AsyncData(user);
      case Failed(:final errorMessage):
        state = AsyncError(FlutterError(errorMessage), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> refreshUserData() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var result = await getLoggedInUser(null);
    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  Future<void> logout() async {
    var logout = ref.read(logoutProvider);
    var result = await logout(null);
    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failed(:final errorMessage):
        state = AsyncError(FlutterError(errorMessage), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  Future<void> topup(int amount) async {
    Topup topup = ref.read(topupProvider);
    String? userId = state.valueOrNull?.uid;
    if (userId != null) {
      var result = await topup(TopupParams(amount: amount, userId: userId));
      if (result.isSuccess) {
        refreshUserData();
        ref.read(transactionDataProvider.notifier).refreshTransactionData();
      }
    }
  }

  Future<void> uploadProfilePicture({
    required User user,
    required File imageFile,
  }) async {
    UploadProfilePicture uploadProfilePicture = ref.read(
      uploadProfilePictureProvider,
    );
    final result = await uploadProfilePicture(
      UploadProfilePictureParams(imageFile: imageFile, user: user),
    );
    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  void _getMovies() {
    ref.read(nowPlayingProvider.notifier).getMovies();
    ref.read(upcomingProvider.notifier).getMovies();
  }
}
