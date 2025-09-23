part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object?> get props => [];
}

class SaveExpenseEvent extends ExpenseEvent {
  final CategoryTransactionDto transaction;

  const SaveExpenseEvent(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class DeleteExpenseEvent extends ExpenseEvent {
  final String id;

  const DeleteExpenseEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class LoadExpensesEvent extends ExpenseEvent {}

class LoadTotalExpensesEvent extends ExpenseEvent {
  const LoadTotalExpensesEvent();

  @override
  List<Object?> get props => [];
}

class ExpensesPeriodChanged extends ExpenseEvent {
  final int selectedPeriodIndex; // 0 = Daily, 1 = Weekly, 2 = Monthly

  const ExpensesPeriodChanged(this.selectedPeriodIndex);

  @override
  List<Object?> get props => [selectedPeriodIndex];
}

class _TransactionsUpdated extends ExpenseEvent {
  final List<CategoryTransactionDto> transactions;

  const _TransactionsUpdated(this.transactions);

  @override
  List<Object?> get props => [transactions];
}
