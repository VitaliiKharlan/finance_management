import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_state.freezed.dart';

@freezed
abstract class ExpensesState with _$ExpensesState {
  @override
  double get totalExpense;

  const factory ExpensesState.initial({@Default(0.0) double totalExpense}) =
      ExpensesInitial;

  const factory ExpensesState.saving({@Default(0.0) double totalExpense}) =
      ExpensesSaving;

  const factory ExpensesState.saved({@Default(0.0) double totalExpense}) =
      ExpensesSaved;

  const factory ExpensesState.failure(
    String message, {
    @Default(0.0) double totalExpense,
  }) = ExpensesFailure;
}
