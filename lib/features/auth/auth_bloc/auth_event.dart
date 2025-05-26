part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

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

class LogoutRequested extends AuthEvent {}
