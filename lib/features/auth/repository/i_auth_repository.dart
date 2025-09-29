import '../models/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity> getUser(String uid);

  Future<void> registerCustomer({
    required UserEntity user,
    required String password,
  });

  Future<UserEntity> login({required String email, required String password});

  Future<void> logout();

  Future<void> resetPassword({required String email});
}
