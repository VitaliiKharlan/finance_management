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

class DeleteTransactionEvent extends CategoriesEvent {
  final String id;

  DeleteTransactionEvent(this.id);
}

class EditTransactionEvent extends CategoriesEvent {
  final CategoryTransactionDto transaction;

  EditTransactionEvent(this.transaction);
}

class UpdateTransactionEvent extends CategoriesEvent {
  final String id;
  final Map<String, dynamic> updatedData;

  UpdateTransactionEvent({required this.id, required this.updatedData});
}