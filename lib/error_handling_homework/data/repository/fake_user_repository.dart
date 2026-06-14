import 'package:flutter_homework/error_handling_homework/data/repository/entity/user_entity.dart';

class FakeUserRepository {
  Future<UserEntity> getUserProfile(bool shouldFail) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (shouldFail) {
      throw
      //Exception('asdasd');
      //print('asdasd');
      CustomServerError('shouldFail');
    }
    return UserEntity(id: '1', name: 'Test User');
  }
}

class CustomServerError implements Exception {
  CustomServerError(this.status);

  final String status;

  @override
  String toString() => 'Server unavaible. Reason : $status';
}
