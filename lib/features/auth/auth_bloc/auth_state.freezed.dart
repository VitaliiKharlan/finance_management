// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }


}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthInitial);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.initial()';
  }


}


/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthLoading);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loading()';
  }


}


/// @nodoc


class AuthSuccess implements AuthState {
  const AuthSuccess();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthSuccess);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.success()';
  }


}


/// @nodoc


class Authenticated implements AuthState {
  const Authenticated({required this.user});


  final UserEntity user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Authenticated &&
            (identical(other.user, user) || other.user == user));
  }


  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value,
      $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;

  @useResult
  $Res call({
    UserEntity user
  });


}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
    return _then(Authenticated(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
      as UserEntity,
    ));
  }


}

/// @nodoc


class Unauthenticated implements AuthState {
  const Unauthenticated();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthenticated);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }


}


/// @nodoc


class AuthFailure implements AuthState {
  const AuthFailure(this.message);


  final String message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthFailure &&
            (identical(other.message, message) || other.message == message));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthState.failure(message: $message)';
  }


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value,
      $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;

  @useResult
  $Res call({
    String message
  });


}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
    return _then(AuthFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
