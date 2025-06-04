// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpensesState {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExpensesState()';
  }


}

/// @nodoc
class $ExpensesStateCopyWith<$Res> {
  $ExpensesStateCopyWith(ExpensesState _, $Res Function(ExpensesState) __);
}


/// @nodoc


class ExpensesInitial implements ExpensesState {
  const ExpensesInitial();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesInitial);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExpensesState.initial()';
  }


}


/// @nodoc


class ExpensesSaving implements ExpensesState {
  const ExpensesSaving();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesSaving);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExpensesState.saving()';
  }


}


/// @nodoc


class ExpensesSaved implements ExpensesState {
  const ExpensesSaved();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesSaved);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ExpensesState.saved()';
  }


}


/// @nodoc


class ExpensesFailure implements ExpensesState {
  const ExpensesFailure(this.message);


  final String message;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpensesFailureCopyWith<ExpensesFailure> get copyWith =>
      _$ExpensesFailureCopyWithImpl<ExpensesFailure>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesFailure &&
            (identical(other.message, message) || other.message == message));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ExpensesState.failure(message: $message)';
  }


}

/// @nodoc
abstract mixin class $ExpensesFailureCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory $ExpensesFailureCopyWith(ExpensesFailure value,
      $Res Function(ExpensesFailure) _then) = _$ExpensesFailureCopyWithImpl;

  @useResult
  $Res call({
    String message
  });


}

/// @nodoc
class _$ExpensesFailureCopyWithImpl<$Res>
    implements $ExpensesFailureCopyWith<$Res> {
  _$ExpensesFailureCopyWithImpl(this._self, this._then);

  final ExpensesFailure _self;
  final $Res Function(ExpensesFailure) _then;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
    return _then(ExpensesFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
