part of 'expenses_bloc.dart';

abstract class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object?> get props => [];
}

class SaveExpenseEvent extends ExpensesEvent {
  final String category;
  final DateTime timeAndDate;
  final double amount;
  final String title;
  final String? message;
  final String? id; // если передан, значит редактируем

  const SaveExpenseEvent({
    required this.category,
    required this.timeAndDate,
    required this.amount,
    required this.title,
    this.message,
    this.id,
  });

  @override
  List<Object?> get props =>
      [category, timeAndDate, amount, title, message, id];
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
