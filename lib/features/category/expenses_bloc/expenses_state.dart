import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_state.freezed.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial() = ExpensesInitial;

  const factory ExpensesState.saving() = ExpensesSaving;

  const factory ExpensesState.saved() = ExpensesSaved;

  const factory ExpensesState.failure(String message) = ExpensesFailure;
}
