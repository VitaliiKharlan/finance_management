import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../auth_service.dart';
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
  }) : _authRepository = authRepository,
       _authService = authService,
       super(AuthInitial()) {
    on<AuthStarted>(_onAuthStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterCustomerRequested>(_onRegisterCustomerRequested);
    on<LogoutRequested>(_onLogoutRequested);

    _authStateSubscription = _authService.authStateChanges.listen((user) {
      if (user == null && state is! Unauthenticated) {
        add(LogoutRequested());
      }
    });
  }

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    final currentUser = _authService.currentUser;
    if (currentUser != null) {
      try {
        print('User found with UID: ${currentUser.uid}');
        final user = await _authRepository.getUser(currentUser.uid);
        print('User data loaded: $user');
        emit(Authenticated(user: user));
      } catch (e) {
        print('Failed to load user data: $e');
        emit(AuthFailure('Failed to load user data'));
      }
    } else {
      print('No current user, emit Unauthenticated');
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _authService.signIn(email: event.email, password: event.password);

      final firebaseUser = _authService.currentUser;
      if (firebaseUser != null) {
        final user = await _authRepository.getUser(firebaseUser.uid);
        emit(Authenticated(user: user));
      } else {
        emit(Unauthenticated());
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(AuthFailure('User not found'));
          break;
        case 'wrong-password':
          emit(AuthFailure('Incorrect password'));
          break;
        case 'invalid-email':
          emit(AuthFailure('Incorrect email'));
          break;
        case 'user-disabled':
          emit(AuthFailure('Account disabled'));
          break;
        default:
          emit(AuthFailure(e.message ?? 'Login error'));
      }
    } catch (e) {
      emit(AuthFailure('Unknown error: ${e.toString()}'));
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

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
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
