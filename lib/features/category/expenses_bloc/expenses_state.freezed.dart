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

  double get totalExpense;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpensesStateCopyWith<ExpensesState> get copyWith =>
      _$ExpensesStateCopyWithImpl<ExpensesState>(
          this as ExpensesState, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesState &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense));
  }


  @override
  int get hashCode => Object.hash(runtimeType, totalExpense);

  @override
  String toString() {
    return 'ExpensesState(totalExpense: $totalExpense)';
  }


}

/// @nodoc
abstract mixin class $ExpensesStateCopyWith<$Res> {
  factory $ExpensesStateCopyWith(ExpensesState value,
      $Res Function(ExpensesState) _then) = _$ExpensesStateCopyWithImpl;

  @useResult
  $Res call({
    double totalExpense
  });


}

/// @nodoc
class _$ExpensesStateCopyWithImpl<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  _$ExpensesStateCopyWithImpl(this._self, this._then);

  final ExpensesState _self;
  final $Res Function(ExpensesState) _then;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalExpense = null,}) {
    return _then(_self.copyWith(
      totalExpense: null == totalExpense
          ? _self.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
      as double,
    ));
  }

}


/// @nodoc


class ExpensesInitial implements ExpensesState {
  const ExpensesInitial({this.totalExpense = 0.0});


  @override
  @JsonKey()
  final double totalExpense;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpensesInitialCopyWith<ExpensesInitial> get copyWith =>
      _$ExpensesInitialCopyWithImpl<ExpensesInitial>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesInitial &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense));
  }


  @override
  int get hashCode => Object.hash(runtimeType, totalExpense);

  @override
  String toString() {
    return 'ExpensesState.initial(totalExpense: $totalExpense)';
  }


}

/// @nodoc
abstract mixin class $ExpensesInitialCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory $ExpensesInitialCopyWith(ExpensesInitial value,
      $Res Function(ExpensesInitial) _then) = _$ExpensesInitialCopyWithImpl;

  @override
  @useResult
  $Res call({
    double totalExpense
  });


}

/// @nodoc
class _$ExpensesInitialCopyWithImpl<$Res>
    implements $ExpensesInitialCopyWith<$Res> {
  _$ExpensesInitialCopyWithImpl(this._self, this._then);

  final ExpensesInitial _self;
  final $Res Function(ExpensesInitial) _then;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? totalExpense = null,}) {
    return _then(ExpensesInitial(
      totalExpense: null == totalExpense
          ? _self.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
      as double,
    ));
  }


}

/// @nodoc


class ExpensesSaving implements ExpensesState {
  const ExpensesSaving({this.totalExpense = 0.0});


  @override
  @JsonKey()
  final double totalExpense;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpensesSavingCopyWith<ExpensesSaving> get copyWith =>
      _$ExpensesSavingCopyWithImpl<ExpensesSaving>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesSaving &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense));
  }


  @override
  int get hashCode => Object.hash(runtimeType, totalExpense);

  @override
  String toString() {
    return 'ExpensesState.saving(totalExpense: $totalExpense)';
  }


}

/// @nodoc
abstract mixin class $ExpensesSavingCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory $ExpensesSavingCopyWith(ExpensesSaving value,
      $Res Function(ExpensesSaving) _then) = _$ExpensesSavingCopyWithImpl;

  @override
  @useResult
  $Res call({
    double totalExpense
  });


}

/// @nodoc
class _$ExpensesSavingCopyWithImpl<$Res>
    implements $ExpensesSavingCopyWith<$Res> {
  _$ExpensesSavingCopyWithImpl(this._self, this._then);

  final ExpensesSaving _self;
  final $Res Function(ExpensesSaving) _then;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? totalExpense = null,}) {
    return _then(ExpensesSaving(
      totalExpense: null == totalExpense
          ? _self.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
      as double,
    ));
  }


}

/// @nodoc


class ExpensesSaved implements ExpensesState {
  const ExpensesSaved({this.totalExpense = 0.0});


  @override
  @JsonKey()
  final double totalExpense;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpensesSavedCopyWith<ExpensesSaved> get copyWith =>
      _$ExpensesSavedCopyWithImpl<ExpensesSaved>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesSaved &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense));
  }


  @override
  int get hashCode => Object.hash(runtimeType, totalExpense);

  @override
  String toString() {
    return 'ExpensesState.saved(totalExpense: $totalExpense)';
  }


}

/// @nodoc
abstract mixin class $ExpensesSavedCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory $ExpensesSavedCopyWith(ExpensesSaved value,
      $Res Function(ExpensesSaved) _then) = _$ExpensesSavedCopyWithImpl;

  @override
  @useResult
  $Res call({
    double totalExpense
  });


}

/// @nodoc
class _$ExpensesSavedCopyWithImpl<$Res>
    implements $ExpensesSavedCopyWith<$Res> {
  _$ExpensesSavedCopyWithImpl(this._self, this._then);

  final ExpensesSaved _self;
  final $Res Function(ExpensesSaved) _then;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? totalExpense = null,}) {
    return _then(ExpensesSaved(
      totalExpense: null == totalExpense
          ? _self.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
      as double,
    ));
  }


}

/// @nodoc


class ExpensesFailure implements ExpensesState {
  const ExpensesFailure(this.message, {this.totalExpense = 0.0});


  final String message;
  @override
  @JsonKey()
  final double totalExpense;

  /// Create a copy of ExpensesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExpensesFailureCopyWith<ExpensesFailure> get copyWith =>
      _$ExpensesFailureCopyWithImpl<ExpensesFailure>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpensesFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message, totalExpense);

  @override
  String toString() {
    return 'ExpensesState.failure(message: $message, totalExpense: $totalExpense)';
  }


}

/// @nodoc
abstract mixin class $ExpensesFailureCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory $ExpensesFailureCopyWith(ExpensesFailure value,
      $Res Function(ExpensesFailure) _then) = _$ExpensesFailureCopyWithImpl;

  @override
  @useResult
  $Res call({
    String message, double totalExpense
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
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? message = null, Object? totalExpense = null,}) {
    return _then(ExpensesFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String, totalExpense: null == totalExpense
        ? _self.totalExpense
        : totalExpense // ignore: cast_nullable_to_non_nullable
    as double,
    ));
  }


}

// dart format on
