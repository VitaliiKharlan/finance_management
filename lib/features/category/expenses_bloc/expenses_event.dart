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
  final String message;

  const SaveExpenseEvent({
    required this.category,
    required this.timeAndDate,
    required this.amount,
    required this.title,
    required this.message,
  });

  @override
  List<Object?> get props => [category, timeAndDate, amount, title, message];
}

class LoadTotalExpenseEvent extends ExpensesEvent {
  const LoadTotalExpenseEvent();

  @override
  List<Object?> get props => [];
}
