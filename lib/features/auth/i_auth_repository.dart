import 'package:finance_management/features/auth/user_entity.dart';

import 'customer.dart';

abstract class IAuthRepository<T> {
  Future<T> getUser(String uid);

  Future<void> registerCustomer({
    required UserEntity user,
    required Customer customer,
    required String password,
  });
}
