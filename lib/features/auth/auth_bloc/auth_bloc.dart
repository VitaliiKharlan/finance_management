import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../customer.dart';
import '../user_entity.dart';
import 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterCustomerRequested>(_onRegisterCustomerRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _authRepository.login(event.email, event.password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Login failed'));
    } catch (e) {
      emit(AuthFailure('Unexpected error: ${e.toString()}'));
    }
  }

  Future<void> _onRegisterCustomerRequested(
    RegisterCustomerRequested event,
    Emitter<AuthState> emit,
  ) async {
    if (event.password != event.confirmPassword) {
      emit(AuthFailure('Passwords do not match'));
      return;
    }

    emit(AuthLoading());

    try {
      await _authRepository.registerCustomer(
        user: event.user,
        customer: event.customer,
        password: event.password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure('Failed to register: ${e.toString()}'));
    }
  }
}
