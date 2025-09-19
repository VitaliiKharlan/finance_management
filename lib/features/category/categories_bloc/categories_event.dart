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

class EditTransactionInCategoryEvent extends CategoriesEvent {
  final CategoryTransactionDto transaction;

  EditTransactionInCategoryEvent(this.transaction);
}

class DeleteTransactionInCategoryEvent extends CategoriesEvent {
  final String id;

  DeleteTransactionInCategoryEvent(this.id);
}

class UpdateTransactionInCategoryEvent extends CategoriesEvent {
  final CategoryTransactionDto updatedTransaction;

  UpdateTransactionInCategoryEvent(this.updatedTransaction);
}
