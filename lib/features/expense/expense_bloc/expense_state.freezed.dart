// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_state.dart';

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
  $ExpensesStateCopyWith<ExpenseState> get copyWith =>
      _$ExpensesStateCopyWithImpl<ExpenseState>(
          this as ExpenseState, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExpenseState &&
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
  factory $ExpensesStateCopyWith(ExpenseState value,
      $Res Function(ExpenseState) _then) = _$ExpensesStateCopyWithImpl;

  @useResult
  $Res call({
    double totalExpense
  });


}

/// @nodoc
class _$ExpensesStateCopyWithImpl<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  _$ExpensesStateCopyWithImpl(this._self, this._then);

  final ExpenseState _self;
  final $Res Function(ExpenseState) _then;

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


/// Adds pattern-matching-related methods to [ExpenseState].
extension ExpensesStatePatterns on ExpenseState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  {

  TResult

  Function

  (

  ExpensesInitial

  value

  )

  ?

  initial

  ,

  TResult

  Function

  (

  ExpensesSaved

  value

  )

  ?

  saved

  ,

  TResult

  Function

  (

  ExpensesFailure

  value

  )

  ?

  failure

  ,

  TResult

  Function

  (

  ExpensesLoading

  value

  )

  ?

  loading

  ,

  TResult

  Function

  (

  ExpensesLoaded

  value

  )

  ?

  loaded

  ,

  required

  TResult

  orElse

  (

  )

  ,
}){
final _that = this;
switch (_that) {
case ExpensesInitial() when initial != null:
return initial(_that);case ExpensesSaved() when saved != null:
return saved(_that);case ExpensesFailure() when failure != null:
return failure(_that);case ExpensesLoading() when loading != null:
return loading(_that);case ExpensesLoaded() when loaded != null:
return loaded(_that);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs
TResult map<TResult extends Object?>(
    {required TResult Function( ExpensesInitial value) initial, required TResult Function( ExpensesSaved value) saved, required TResult Function( ExpensesFailure value) failure, required TResult Function( ExpensesLoading value) loading, required TResult Function( ExpensesLoaded value) loaded,}) {
  final _that = this;
  switch (_that) {
    case ExpensesInitial():
      return initial(_that);
    case ExpensesSaved():
      return saved(_that);
    case ExpensesFailure():
      return failure(_that);
    case ExpensesLoading():
      return loading(_that);
    case ExpensesLoaded():
      return loaded(_that);
    case _:
      throw StateError('Unexpected subclass');
  }
}

/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>(
    {TResult? Function( ExpensesInitial value)? initial, TResult? Function( ExpensesSaved value)? saved, TResult? Function( ExpensesFailure value)? failure, TResult? Function( ExpensesLoading value)? loading, TResult? Function( ExpensesLoaded value)? loaded,}) {
  final _that = this;
  switch (_that) {
    case ExpensesInitial() when initial != null:
      return initial(_that);
    case ExpensesSaved() when saved != null:
      return saved(_that);
    case ExpensesFailure() when failure != null:
      return failure(_that);
    case ExpensesLoading() when loading != null:
      return loading(_that);
    case ExpensesLoaded() when loaded != null:
      return loaded(_that);
    case _:
      return null;
  }
}

/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen
<
TResult extends Object?>(
{
TResult
Function
(
double
totalExpense
)
?
initial
,
TResult
Function
(
double
totalExpense
)
?
saved
,
TResult
Function
(
String
message
,
double
totalExpense
)
?
failure
,
TResult
Function
(
double
totalExpense
,
List
<
CategoryTransactionDto
>
transactions
)
?
loading
,
TResult
Function
(
double
totalExpense
,
List
<
CategoryTransactionDto
>
transactions
,
List
<
CategoryTransactionDto
>
filteredTransactions
)
?
loaded
,
required
TResult
orElse(),}) {final _that = this;
switch (_that) {
case ExpensesInitial() when initial != null:
return initial(_that.totalExpense);case ExpensesSaved() when saved != null:
return saved(_that.totalExpense);case ExpensesFailure() when failure != null:
return failure(_that.message,_that.totalExpense);case ExpensesLoading() when loading != null:
return loading(_that.totalExpense,_that.transactions);case ExpensesLoaded() when loaded != null:
return loaded(_that.totalExpense,_that.transactions,_that.filteredTransactions);case _:
return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double totalExpense) initial,required TResult Function( double totalExpense) saved,required TResult Function( String message, double totalExpense) failure,required TResult Function( double totalExpense, List<CategoryTransactionDto> transactions) loading,required TResult Function( double totalExpense, List<CategoryTransactionDto> transactions, List<CategoryTransactionDto> filteredTransactions) loaded,}) {final _that = this;
switch (_that) {
case ExpensesInitial():
return initial(_that.totalExpense);case ExpensesSaved():
return saved(_that.totalExpense);case ExpensesFailure():
return failure(_that.message,_that.totalExpense);case ExpensesLoading():
return loading(_that.totalExpense,_that.transactions);case ExpensesLoaded():
return loaded(_that.totalExpense,_that.transactions,_that.filteredTransactions);case _:
throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double totalExpense)? initial,TResult? Function( double totalExpense)? saved,TResult? Function( String message, double totalExpense)? failure,TResult? Function( double totalExpense, List<CategoryTransactionDto> transactions)? loading,TResult? Function( double totalExpense, List<CategoryTransactionDto> transactions, List<CategoryTransactionDto> filteredTransactions)? loaded,}) {final _that = this;
switch (_that) {
case ExpensesInitial() when initial != null:
return initial(_that.totalExpense);case ExpensesSaved() when saved != null:
return saved(_that.totalExpense);case ExpensesFailure() when failure != null:
return failure(_that.message,_that.totalExpense);case ExpensesLoading() when loading != null:
return loading(_that.totalExpense,_that.transactions);case ExpensesLoaded() when loaded != null:
return loaded(_that.totalExpense,_that.transactions,_that.filteredTransactions);case _:
return null;

}
}

}

/// @nodoc


class ExpensesInitial implements ExpenseState {
const ExpensesInitial({this.totalExpense = 0.0});


@override@JsonKey() final double totalExpense;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesInitialCopyWith<ExpensesInitial> get copyWith => _$ExpensesInitialCopyWithImpl<ExpensesInitial>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesInitial&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}


@override
int get hashCode => Object.hash(runtimeType,totalExpense);

@override
String toString() {
return 'ExpensesState.initial(totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class $ExpensesInitialCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
factory $ExpensesInitialCopyWith(ExpensesInitial value, $Res Function(ExpensesInitial) _then) = _$ExpensesInitialCopyWithImpl;
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalExpense = null,}) {
return _then(ExpensesInitial(
totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,
));
}


}

/// @nodoc


class ExpensesSaved implements ExpenseState {
const ExpensesSaved({this.totalExpense = 0.0});


@override@JsonKey() final double totalExpense;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesSavedCopyWith<ExpensesSaved> get copyWith => _$ExpensesSavedCopyWithImpl<ExpensesSaved>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesSaved&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}


@override
int get hashCode => Object.hash(runtimeType,totalExpense);

@override
String toString() {
return 'ExpensesState.saved(totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class $ExpensesSavedCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
factory $ExpensesSavedCopyWith(ExpensesSaved value, $Res Function(ExpensesSaved) _then) = _$ExpensesSavedCopyWithImpl;
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalExpense = null,}) {
return _then(ExpensesSaved(
totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,
));
}


}

/// @nodoc


class ExpensesFailure implements ExpenseState {
const ExpensesFailure(this.message, {this.totalExpense = 0.0});


final String message;
@override@JsonKey() final double totalExpense;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesFailureCopyWith<ExpensesFailure> get copyWith => _$ExpensesFailureCopyWithImpl<ExpensesFailure>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}


@override
int get hashCode => Object.hash(runtimeType,message,totalExpense);

@override
String toString() {
return 'ExpensesState.failure(message: $message, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class $ExpensesFailureCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
factory $ExpensesFailureCopyWith(ExpensesFailure value, $Res Function(ExpensesFailure) _then) = _$ExpensesFailureCopyWithImpl;
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? totalExpense = null,}) {
return _then(ExpensesFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,
));
}


}

/// @nodoc


class ExpensesLoading implements ExpenseState {
const ExpensesLoading({this.totalExpense = 0.0, final List<CategoryTransactionDto> transactions = const []}): _transactions = transactions;


@override@JsonKey() final double totalExpense;
final List<CategoryTransactionDto> _transactions;
@JsonKey() List<CategoryTransactionDto> get transactions {
if (_transactions is EqualUnmodifiableListView) return _transactions;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesLoadingCopyWith<ExpensesLoading> get copyWith => _$ExpensesLoadingCopyWithImpl<ExpensesLoading>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesLoading&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}


@override
int get hashCode => Object.hash(runtimeType,totalExpense,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
return 'ExpensesState.loading(totalExpense: $totalExpense, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $ExpensesLoadingCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
factory $ExpensesLoadingCopyWith(ExpensesLoading value, $Res Function(ExpensesLoading) _then) = _$ExpensesLoadingCopyWithImpl;
@override @useResult
$Res call({
double totalExpense, List<CategoryTransactionDto> transactions
});


}
/// @nodoc
class _$ExpensesLoadingCopyWithImpl<$Res>
implements $ExpensesLoadingCopyWith<$Res> {
_$ExpensesLoadingCopyWithImpl(this._self, this._then);

final ExpensesLoading _self;
final $Res Function(ExpensesLoading) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalExpense = null,Object? transactions = null,}) {
return _then(ExpensesLoading(
totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<CategoryTransactionDto>,
));
}


}

/// @nodoc


class ExpensesLoaded implements ExpenseState {
const ExpensesLoaded({this.totalExpense = 0.0, final List<CategoryTransactionDto> transactions = const [], required final List<CategoryTransactionDto> filteredTransactions}): _transactions = transactions,_filteredTransactions = filteredTransactions;


@override@JsonKey() final double totalExpense;
final List<CategoryTransactionDto> _transactions;
@JsonKey() List<CategoryTransactionDto> get transactions {
if (_transactions is EqualUnmodifiableListView) return _transactions;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_transactions);
}

final List<CategoryTransactionDto> _filteredTransactions;
List<CategoryTransactionDto> get filteredTransactions {
if (_filteredTransactions is EqualUnmodifiableListView) return _filteredTransactions;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_filteredTransactions);
}


/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesLoadedCopyWith<ExpensesLoaded> get copyWith => _$ExpensesLoadedCopyWithImpl<ExpensesLoaded>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesLoaded&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&const DeepCollectionEquality().equals(other._filteredTransactions, _filteredTransactions));
}


@override
int get hashCode => Object.hash(runtimeType,totalExpense,const DeepCollectionEquality().hash(_transactions),const DeepCollectionEquality().hash(_filteredTransactions));

@override
String toString() {
return 'ExpensesState.loaded(totalExpense: $totalExpense, transactions: $transactions, filteredTransactions: $filteredTransactions)';
}


}

/// @nodoc
abstract mixin class $ExpensesLoadedCopyWith<$Res> implements $ExpensesStateCopyWith<$Res> {
factory $ExpensesLoadedCopyWith(ExpensesLoaded value, $Res Function(ExpensesLoaded) _then) = _$ExpensesLoadedCopyWithImpl;
@override @useResult
$Res call({
double totalExpense, List<CategoryTransactionDto> transactions, List<CategoryTransactionDto> filteredTransactions
});


}
/// @nodoc
class _$ExpensesLoadedCopyWithImpl<$Res>
implements $ExpensesLoadedCopyWith<$Res> {
_$ExpensesLoadedCopyWithImpl(this._self, this._then);

final ExpensesLoaded _self;
final $Res Function(ExpensesLoaded) _then;

/// Create a copy of ExpensesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalExpense = null,Object? transactions = null,Object? filteredTransactions = null,}) {
return _then(ExpensesLoaded(
totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<CategoryTransactionDto>,filteredTransactions: null == filteredTransactions ? _self._filteredTransactions : filteredTransactions // ignore: cast_nullable_to_non_nullable
as List<CategoryTransactionDto>,
));
}


}

// dart format on
