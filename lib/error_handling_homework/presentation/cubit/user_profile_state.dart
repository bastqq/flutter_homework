import 'package:flutter_homework/error_handling_homework/data/repository/entity/user_entity.dart';
import 'package:flutter_homework/error_handling_homework/data/repository/fake_user_repository.dart';

sealed class UserProfileState {}

final class UserProfileLoading implements UserProfileState {}

final class UserProfileLoaded implements UserProfileState {
  UserProfileLoaded(this.user);

  final UserEntity user;
}

final class UserProfileError implements UserProfileState {
  UserProfileError(this.error);

  final CustomServerError error;
}
