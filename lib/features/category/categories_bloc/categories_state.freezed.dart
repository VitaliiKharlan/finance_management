// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState()';
}


}

/// @nodoc
class $CategoriesStateCopyWith<$Res>  {
$CategoriesStateCopyWith(CategoriesState _, $Res Function(CategoriesState) __);
}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoriesInitialState value)?  initial,TResult Function( CategoriesLoadingState value)?  loading,TResult Function( CategoriesLoadedState value)?  loaded,TResult Function( CategoriesAddExpenseState value)?  addExpense,TResult Function( CategoriesFailureState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoriesInitialState() when initial != null:
return initial(_that);case CategoriesLoadingState() when loading != null:
return loading(_that);case CategoriesLoadedState() when loaded != null:
return loaded(_that);case CategoriesAddExpenseState() when addExpense != null:
return addExpense(_that);case CategoriesFailureState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoriesInitialState value)  initial,required TResult Function( CategoriesLoadingState value)  loading,required TResult Function( CategoriesLoadedState value)  loaded,required TResult Function( CategoriesAddExpenseState value)  addExpense,required TResult Function( CategoriesFailureState value)  failure,}){
final _that = this;
switch (_that) {
case CategoriesInitialState():
return initial(_that);case CategoriesLoadingState():
return loading(_that);case CategoriesLoadedState():
return loaded(_that);case CategoriesAddExpenseState():
return addExpense(_that);case CategoriesFailureState():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoriesInitialState value)?  initial,TResult? Function( CategoriesLoadingState value)?  loading,TResult? Function( CategoriesLoadedState value)?  loaded,TResult? Function( CategoriesAddExpenseState value)?  addExpense,TResult? Function( CategoriesFailureState value)?  failure,}){
final _that = this;
switch (_that) {
case CategoriesInitialState() when initial != null:
return initial(_that);case CategoriesLoadingState() when loading != null:
return loading(_that);case CategoriesLoadedState() when loaded != null:
return loaded(_that);case CategoriesAddExpenseState() when addExpense != null:
return addExpense(_that);case CategoriesFailureState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int selectedIndex,  CategoryEnum selectedCategory,  List<CategoryTransactionDto> filteredTransactions,  bool showTransactions)?  loaded,TResult Function( CategoryTransactionDto? transactionToEdit)?  addExpense,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoriesInitialState() when initial != null:
return initial();case CategoriesLoadingState() when loading != null:
return loading();case CategoriesLoadedState() when loaded != null:
return loaded(_that.selectedIndex,_that.selectedCategory,_that.filteredTransactions,_that.showTransactions);case CategoriesAddExpenseState() when addExpense != null:
return addExpense(_that.transactionToEdit);case CategoriesFailureState() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int selectedIndex,  CategoryEnum selectedCategory,  List<CategoryTransactionDto> filteredTransactions,  bool showTransactions)  loaded,required TResult Function( CategoryTransactionDto? transactionToEdit)  addExpense,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case CategoriesInitialState():
return initial();case CategoriesLoadingState():
return loading();case CategoriesLoadedState():
return loaded(_that.selectedIndex,_that.selectedCategory,_that.filteredTransactions,_that.showTransactions);case CategoriesAddExpenseState():
return addExpense(_that.transactionToEdit);case CategoriesFailureState():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int selectedIndex,  CategoryEnum selectedCategory,  List<CategoryTransactionDto> filteredTransactions,  bool showTransactions)?  loaded,TResult? Function( CategoryTransactionDto? transactionToEdit)?  addExpense,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case CategoriesInitialState() when initial != null:
return initial();case CategoriesLoadingState() when loading != null:
return loading();case CategoriesLoadedState() when loaded != null:
return loaded(_that.selectedIndex,_that.selectedCategory,_that.filteredTransactions,_that.showTransactions);case CategoriesAddExpenseState() when addExpense != null:
return addExpense(_that.transactionToEdit);case CategoriesFailureState() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CategoriesInitialState implements CategoriesState {
  const CategoriesInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.initial()';
}


}




/// @nodoc


class CategoriesLoadingState implements CategoriesState {
  const CategoriesLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.loading()';
}


}




/// @nodoc


class CategoriesLoadedState implements CategoriesState {
  const CategoriesLoadedState({required this.selectedIndex, required this.selectedCategory, required final  List<CategoryTransactionDto> filteredTransactions, this.showTransactions = false}): _filteredTransactions = filteredTransactions;
  

 final  int selectedIndex;
 final  CategoryEnum selectedCategory;
 final  List<CategoryTransactionDto> _filteredTransactions;
 List<CategoryTransactionDto> get filteredTransactions {
  if (_filteredTransactions is EqualUnmodifiableListView) return _filteredTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredTransactions);
}

@JsonKey() final  bool showTransactions;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesLoadedStateCopyWith<CategoriesLoadedState> get copyWith => _$CategoriesLoadedStateCopyWithImpl<CategoriesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesLoadedState&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other._filteredTransactions, _filteredTransactions)&&(identical(other.showTransactions, showTransactions) || other.showTransactions == showTransactions));
}


@override
int get hashCode => Object.hash(runtimeType,selectedIndex,selectedCategory,const DeepCollectionEquality().hash(_filteredTransactions),showTransactions);

@override
String toString() {
  return 'CategoriesState.loaded(selectedIndex: $selectedIndex, selectedCategory: $selectedCategory, filteredTransactions: $filteredTransactions, showTransactions: $showTransactions)';
}


}

/// @nodoc
abstract mixin class $CategoriesLoadedStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesLoadedStateCopyWith(CategoriesLoadedState value, $Res Function(CategoriesLoadedState) _then) = _$CategoriesLoadedStateCopyWithImpl;
@useResult
$Res call({
 int selectedIndex, CategoryEnum selectedCategory, List<CategoryTransactionDto> filteredTransactions, bool showTransactions
});




}
/// @nodoc
class _$CategoriesLoadedStateCopyWithImpl<$Res>
    implements $CategoriesLoadedStateCopyWith<$Res> {
  _$CategoriesLoadedStateCopyWithImpl(this._self, this._then);

  final CategoriesLoadedState _self;
  final $Res Function(CategoriesLoadedState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedIndex = null,Object? selectedCategory = null,Object? filteredTransactions = null,Object? showTransactions = null,}) {
  return _then(CategoriesLoadedState(
selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CategoryEnum,filteredTransactions: null == filteredTransactions ? _self._filteredTransactions : filteredTransactions // ignore: cast_nullable_to_non_nullable
as List<CategoryTransactionDto>,showTransactions: null == showTransactions ? _self.showTransactions : showTransactions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CategoriesAddExpenseState implements CategoriesState {
  const CategoriesAddExpenseState({this.transactionToEdit});
  

 final  CategoryTransactionDto? transactionToEdit;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesAddExpenseStateCopyWith<CategoriesAddExpenseState> get copyWith => _$CategoriesAddExpenseStateCopyWithImpl<CategoriesAddExpenseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesAddExpenseState&&(identical(other.transactionToEdit, transactionToEdit) || other.transactionToEdit == transactionToEdit));
}


@override
int get hashCode => Object.hash(runtimeType,transactionToEdit);

@override
String toString() {
  return 'CategoriesState.addExpense(transactionToEdit: $transactionToEdit)';
}


}

/// @nodoc
abstract mixin class $CategoriesAddExpenseStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesAddExpenseStateCopyWith(CategoriesAddExpenseState value, $Res Function(CategoriesAddExpenseState) _then) = _$CategoriesAddExpenseStateCopyWithImpl;
@useResult
$Res call({
 CategoryTransactionDto? transactionToEdit
});




}
/// @nodoc
class _$CategoriesAddExpenseStateCopyWithImpl<$Res>
    implements $CategoriesAddExpenseStateCopyWith<$Res> {
  _$CategoriesAddExpenseStateCopyWithImpl(this._self, this._then);

  final CategoriesAddExpenseState _self;
  final $Res Function(CategoriesAddExpenseState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transactionToEdit = freezed,}) {
  return _then(CategoriesAddExpenseState(
transactionToEdit: freezed == transactionToEdit ? _self.transactionToEdit : transactionToEdit // ignore: cast_nullable_to_non_nullable
as CategoryTransactionDto?,
  ));
}


}

/// @nodoc


class CategoriesFailureState implements CategoriesState {
  const CategoriesFailureState(this.message);
  

 final  String message;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesFailureStateCopyWith<CategoriesFailureState> get copyWith => _$CategoriesFailureStateCopyWithImpl<CategoriesFailureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesFailureState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CategoriesState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $CategoriesFailureStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesFailureStateCopyWith(CategoriesFailureState value, $Res Function(CategoriesFailureState) _then) = _$CategoriesFailureStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CategoriesFailureStateCopyWithImpl<$Res>
    implements $CategoriesFailureStateCopyWith<$Res> {
  _$CategoriesFailureStateCopyWithImpl(this._self, this._then);

  final CategoriesFailureState _self;
  final $Res Function(CategoriesFailureState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CategoriesFailureState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
