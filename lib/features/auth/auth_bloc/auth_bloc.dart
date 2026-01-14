import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/locator.dart';
import '../../../core/logger/i_logger_service.dart';
import '../models/user_entity.dart';
import '../repository/i_auth_repository.dart';
import '../services/i_auth_service.dart';
import 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final IAuthService _authService;
  final ILoggerService _logger = getIt<ILoggerService>();

  StreamSubscription<User?>? _authStateSubscription;

  AuthBloc({
    required IAuthRepository authRepository,
    required IAuthService authService,
  }) : _authRepository = authRepository,
       _authService = authService,
       super(AuthInitial()) {
    debugPrint('💡💡💡💡💡AuthBloc created');
    _logger.log(
      'AuthBloc created',
      logLevel: LogLevel.info,
      stackTrace: StackTrace.current,
    );
    on<AuthStarted>(_onAuthStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterCustomerRequested>(_onRegisterCustomerRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<AuthUserChanged>(_onAuthUserChanged);

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
        _logger.log(
          'User found with UID: ${currentUser.uid}',
          logLevel: LogLevel.info,
        );
        final user = await _authRepository.getUser(currentUser.uid);
        _logger.log('User data loaded: $user', logLevel: LogLevel.info);

        emit(Authenticated(user: user));
      } catch (e, s) {
        _logger.log(
          'Failed to load user data: $e',
          error: e,
          stackTrace: s,
          logLevel: LogLevel.error,
        );
        emit(AuthFailure('Failed to load user data'));
      }
    } else {
      _logger.log(
        'No current user, emit Unauthenticated',
        logLevel: LogLevel.info,
      );
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
    } catch (e) {
      emit(AuthFailure(e.toString()));
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

  Future<void> _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    final firebaseUser = event.firebaseUser;
    if (firebaseUser == null) {
      emit(Unauthenticated());
    } else {
      try {
        final user = await _authRepository.getUser(firebaseUser.uid);
        emit(Authenticated(user: user));
      } catch (e) {
        emit(AuthFailure('Failed to load user data'));
      }
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
