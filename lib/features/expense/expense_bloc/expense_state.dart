import 'package:freezed_annotation/freezed_annotation.dart';

import '../../category/models/category_transaction_dto.dart';

part 'expense_state.freezed.dart';

@freezed
abstract class ExpenseState with _$ExpensesState {
  const factory ExpenseState.initial({@Default(0.0) double totalExpense}) =
      ExpensesInitial;

  const factory ExpenseState.saved({@Default(0.0) double totalExpense}) =
      ExpensesSaved;

  const factory ExpenseState.failure(
    String message, {
    @Default(0.0) double totalExpense,
  }) = ExpensesFailure;

  const factory ExpenseState.loading({
    @Default(0.0) double totalExpense,
    @Default([]) List<CategoryTransactionDto> transactions,
  }) = ExpensesLoading;

  const factory ExpenseState.loaded({
    @Default(0.0) double totalExpense,
    @Default([]) List<CategoryTransactionDto> transactions,
    required List<CategoryTransactionDto> filteredTransactions,
  }) = ExpensesLoaded;
}
