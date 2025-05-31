import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/category_transaction_model.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = CategoriesInitialState;

  const factory CategoriesState.loading() = CategoriesLoadingState;

  const factory CategoriesState.loaded({
    required int selectedIndex,
    required String selectedCategory,
    required List<CategoryTransactionModel> filteredTransactions,
    @Default(false) bool showTransactions,
  }) = CategoriesLoadedState;

  const factory CategoriesState.failure(String message) =
      CategoriesFailureState;
}
