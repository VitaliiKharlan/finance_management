part of 'categories_bloc.dart';

abstract class CategoriesEvent {}

class LoadCategoriesEvent extends CategoriesEvent {}

class CategorySelectedEvent extends CategoriesEvent {
  final CategoryEnum category;
  final int index;

  CategorySelectedEvent(this.category, this.index);
}

class CategoryBackEvent extends CategoriesEvent {}

class AddExpenseButtonPressedEvent extends CategoriesEvent {}
