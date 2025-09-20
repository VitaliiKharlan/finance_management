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
  List<Object> get props => [id];
}

class LoadTotalExpenseEvent extends ExpensesEvent {
  const LoadTotalExpenseEvent();

  @override
  List<Object?> get props => [];
}

class LoadExpensesEvent extends ExpensesEvent {}