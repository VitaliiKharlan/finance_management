// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoriesState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoriesState()';
  }


}

/// @nodoc
class $CategoriesStateCopyWith<$Res> {
  $CategoriesStateCopyWith(CategoriesState _,
      $Res Function(CategoriesState) __);
}


/// @nodoc


class CategoriesInitialState implements CategoriesState {
  const CategoriesInitialState();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoriesInitialState);
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoriesLoadingState);
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
  const CategoriesLoadedState(
      {required this.selectedIndex, required this.selectedCategory, required final List<
          CategoryTransactionModel> filteredTransactions, this.showTransactions = false})
      : _filteredTransactions = filteredTransactions;


  final int selectedIndex;
  final CategoryEnum selectedCategory;
  final List<CategoryTransactionModel> _filteredTransactions;

  List<CategoryTransactionModel> get filteredTransactions {
    if (_filteredTransactions is EqualUnmodifiableListView)
      return _filteredTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTransactions);
  }

  @JsonKey() final bool showTransactions;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesLoadedStateCopyWith<CategoriesLoadedState> get copyWith =>
      _$CategoriesLoadedStateCopyWithImpl<CategoriesLoadedState>(
          this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoriesLoadedState &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality().equals(
                other._filteredTransactions, _filteredTransactions) &&
            (identical(other.showTransactions, showTransactions) ||
                other.showTransactions == showTransactions));
  }


  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex, selectedCategory,
      const DeepCollectionEquality().hash(_filteredTransactions),
      showTransactions);

  @override
  String toString() {
    return 'CategoriesState.loaded(selectedIndex: $selectedIndex, selectedCategory: $selectedCategory, filteredTransactions: $filteredTransactions, showTransactions: $showTransactions)';
  }


}

/// @nodoc
abstract mixin class $CategoriesLoadedStateCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesLoadedStateCopyWith(CategoriesLoadedState value,
      $Res Function(CategoriesLoadedState) _then) = _$CategoriesLoadedStateCopyWithImpl;

  @useResult
  $Res call({
    int selectedIndex, CategoryEnum selectedCategory, List<
        CategoryTransactionModel> filteredTransactions, bool showTransactions
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
  @pragma('vm:prefer-inline') $Res call(
      {Object? selectedIndex = null, Object? selectedCategory = null, Object? filteredTransactions = null, Object? showTransactions = null,}) {
    return _then(CategoriesLoadedState(
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
      as int,
      selectedCategory: null == selectedCategory
          ? _self.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
      as CategoryEnum,
      filteredTransactions: null == filteredTransactions
          ? _self._filteredTransactions
          : filteredTransactions // ignore: cast_nullable_to_non_nullable
      as List<CategoryTransactionModel>,
      showTransactions: null == showTransactions
          ? _self.showTransactions
          : showTransactions // ignore: cast_nullable_to_non_nullable
      as bool,
    ));
  }


}

/// @nodoc


class CategoriesAddExpenseState implements CategoriesState {
  const CategoriesAddExpenseState();


  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType &&
        other is CategoriesAddExpenseState);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoriesState.addExpense()';
  }


}


/// @nodoc


class CategoriesFailureState implements CategoriesState {
  const CategoriesFailureState(this.message);


  final String message;

  /// Create a copy of CategoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesFailureStateCopyWith<CategoriesFailureState> get copyWith =>
      _$CategoriesFailureStateCopyWithImpl<CategoriesFailureState>(
          this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoriesFailureState &&
            (identical(other.message, message) || other.message == message));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CategoriesState.failure(message: $message)';
  }


}

/// @nodoc
abstract mixin class $CategoriesFailureStateCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesFailureStateCopyWith(CategoriesFailureState value,
      $Res Function(CategoriesFailureState) _then) = _$CategoriesFailureStateCopyWithImpl;

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
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
