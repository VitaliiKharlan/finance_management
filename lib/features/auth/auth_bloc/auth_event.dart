import '../customer.dart';
import '../user_entity.dart';

abstract class AuthEvent {}

class RegisterCustomerRequested extends AuthEvent {
  final UserEntity user;
  final Customer customer;

  RegisterCustomerRequested({required this.user, required this.customer});
}
