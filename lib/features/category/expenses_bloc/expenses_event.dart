part of 'expenses_bloc.dart';

abstract class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object?> get props => [];
}

class SaveExpenseEvent extends ExpensesEvent {
  final String category;
  final DateTime date;
  final String amount;
  final String title;
  final String message;

  const SaveExpenseEvent({
    required this.category,
    required this.date,
    required this.amount,
    required this.title,
    required this.message,
  });

  @override
  List<Object?> get props => [category, date, amount, title, message];
}
