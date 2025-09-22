part of 'expenses_bloc.dart';

abstract class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object?> get props => [];
}

class SaveExpenseEvent extends ExpensesEvent {
  final CategoryTransactionDto transaction;

  const SaveExpenseEvent(this.transaction);

  @override
  List<Object?> get props => [transaction];
}

class DeleteExpenseEvent extends ExpensesEvent {
  final String id;

  const DeleteExpenseEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class LoadExpensesEvent extends ExpensesEvent {}

class LoadTotalExpenseEvent extends ExpensesEvent {
  const LoadTotalExpenseEvent();

  @override
  List<Object?> get props => [];
}

class ExpensesPeriodChanged extends ExpensesEvent {
  final int selectedPeriodIndex; // 0 = Daily, 1 = Weekly, 2 = Monthly

  const ExpensesPeriodChanged(this.selectedPeriodIndex);

  @override
  List<Object?> get props => [selectedPeriodIndex];
}

class _TransactionsUpdated extends ExpensesEvent {
  final List<CategoryTransactionDto> transactions;

  const _TransactionsUpdated(this.transactions);

  @override
  List<Object?> get props => [transactions];
}