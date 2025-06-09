part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class CategorySelectedEvent extends CategoriesEvent {
  final int index;
  final CategoryEnum category;

  const CategorySelectedEvent(this.index, this.category);

  @override
  List<Object?> get props => [index, category];
}

class CategoryBackEvent extends CategoriesEvent {}

class AddExpenseButtonPressedEvent extends CategoriesEvent {}
