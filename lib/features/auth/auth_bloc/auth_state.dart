import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.loading() = AuthLoading;

  const factory AuthState.success() = AuthSuccess;

  const factory AuthState.authenticated({required UserEntity user}) =
      Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.failure(String message) = AuthFailure;
}
