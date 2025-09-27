import '../models/user_entity.dart';

abstract class IAuthRepository {
  /// Получить пользователя по uid
  Future<UserEntity> getUser(String uid);

  /// Зарегистрировать нового пользователя
  Future<void> registerCustomer({
    required UserEntity user,
    required String password,
  });

  /// Войти в систему
  Future<UserEntity> login({required String email, required String password});

  /// Выйти из аккаунта
  Future<void> logout();

  /// Сброс пароля
  Future<void> resetPassword({required String email});
}
