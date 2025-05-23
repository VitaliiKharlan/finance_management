import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<RegisterCustomerRequested>(_onRegisterCustomerRequested);
  }

  Future<void> _onRegisterCustomerRequested(
    RegisterCustomerRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await authRepository.registerCustomer(
        user: event.user,
        customer: event.customer,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
