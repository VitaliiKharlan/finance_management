part of 'expenses_bloc.dart';

abstract class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object?> get props => [];
}

class SaveExpenseEvent extends ExpensesEvent {
  final String? id;
  final String category;
  final DateTime timeAndDate;
  final double amount;
  final String title;
  final String? message;

  const SaveExpenseEvent({
    this.id,
    required this.category,
    required this.timeAndDate,
    required this.amount,
    required this.title,
    this.message,
  });

  @override
  List<Object?> get props => [
    id,
    category,
    timeAndDate,
    amount,
    title,
    message,
  ];
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
