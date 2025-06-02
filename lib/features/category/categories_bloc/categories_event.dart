part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class CategorySelectedEvent extends CategoriesEvent {
  final int index;
  final String label;

  const CategorySelectedEvent(this.index, this.label);

  @override
  List<Object?> get props => [index, label];
}

class CategoryBackEvent extends CategoriesEvent {}

class AddExpenseButtonPressedEvent extends CategoriesEvent {}
