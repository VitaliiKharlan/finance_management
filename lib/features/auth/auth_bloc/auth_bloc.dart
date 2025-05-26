import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../auth_service.dart';
import '../customer.dart';
import '../user_entity.dart';
import 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final AuthService _authService;

  StreamSubscription<User?>? _authStateSubscription;

  AuthBloc({
    required AuthRepository authRepository,
    required AuthService authService,
  })
      : _authRepository = authRepository,
        _authService = authService,
        super(AuthInitial()) {
    on<AuthStarted>(_onAuthStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterCustomerRequested>(_onRegisterCustomerRequested);
    on<LogoutRequested>(_onLogoutRequested);

    _authStateSubscription = _authService.authStateChanges.listen((user) {
      if (user == null) {
        add(LogoutRequested());
      }
    });
  }

  Future<void> _onAuthStarted(AuthStarted event,
      Emitter<AuthState> emit,) async {
    final currentUser = _authService.currentUser;
    if (currentUser != null) {
      try {
        final user = await _authRepository.getUser(currentUser.uid);
        emit(Authenticated(user: user));
      } catch (e) {
        emit(AuthFailure('Failed to load user data'));
      }
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoginRequested(LoginRequested event,
      Emitter<AuthState> emit,) async {
    emit(AuthLoading());

    try {
      await _authRepository.login(event.email, event.password);

      final firebaseUser = _authService.currentUser;
      if (firebaseUser != null) {
        final user = await _authRepository.getUser(firebaseUser.uid);
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Login failed'));
    } catch (e) {
      emit(AuthFailure('Unexpected error: ${e.toString()}'));
    }
  }

  Future<void> _onRegisterCustomerRequested(RegisterCustomerRequested event,
      Emitter<AuthState> emit,) async {
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

      final firebaseUser = _authService.currentUser;
      if (firebaseUser != null) {
        final user = await _authRepository.getUser(firebaseUser.uid);
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthFailure('Failed to register: ${e.toString()}'));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event,
      Emitter<AuthState> emit,) async {
    emit(AuthLoading());
    await _authService.signOut();
    emit(Unauthenticated());
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
