import '../customer.dart';
import '../user_entity.dart';

abstract class AuthEvent {}

class RegisterCustomerRequested extends AuthEvent {
  final UserEntity user;
  final Customer customer;
  final String password;
  final String confirmPassword;

  RegisterCustomerRequested({
    required this.user,
    required this.customer,
    required this.password,
    required this.confirmPassword,
  });
}
