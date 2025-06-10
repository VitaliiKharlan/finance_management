import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums/category_enum.dart';
import '../models/category_transaction_dto.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = CategoriesInitialState;

  const factory CategoriesState.loading() = CategoriesLoadingState;

  const factory CategoriesState.loaded({
    required int selectedIndex,
    required CategoryEnum selectedCategory,
    required List<CategoryTransactionDto> filteredTransactions,
    @Default(false) bool showTransactions,
  }) = CategoriesLoadedState;

  const factory CategoriesState.addExpense() = CategoriesAddExpenseState;

  const factory CategoriesState.failure(String message) =
      CategoriesFailureState;
}
