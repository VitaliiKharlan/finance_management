import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/category_enum.dart';
import '../models/category_transaction_dto.dart';
import 'categories_state.dart';

part 'categories_event.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final FirebaseFirestore _firestore;

  CategoriesBloc({required FirebaseFirestore firestore})
    : _firestore = firestore,
      super(CategoriesInitialState()) {
    on<CategorySelectedEvent>(_onCategorySelected);
    on<CategoryBackEvent>(_onCategoryBack);
    on<AddExpenseButtonPressedEvent>(_onAddExpensePressed);
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<DeleteTransactionEvent>(_onDeleteTransaction);
    on<EditTransactionEvent>(_onEditTransaction);
    on<UpdateTransactionEvent>(_onUpdateTransaction);
  }

  Future<void> _onCategorySelected(
    CategorySelectedEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(const CategoriesState.loading());

    try {
      final querySnapshot =
      await _firestore
          .collection('transactions')
          .where('category', isEqualTo: event.category.name)
          .get();

      final transactions = querySnapshot.docs
          .map((doc) => CategoryTransactionDtoFirestore.fromFirestore(doc))
          .toList();

      for (var t in transactions) {
        debugPrint('Transaction id: ${t.id}, title: ${t.title}, category: ${t
            .category}');
      }

      transactions.sort((a, b) => b.timeAndDate!.compareTo(a.timeAndDate!));

      emit(
        CategoriesState.loaded(
          selectedIndex: event.index,
          selectedCategory: event.category,
          filteredTransactions: transactions,
        ),
      );
    } catch (e, s) {
      debugPrint('Error loading transactions: $e');
      debugPrintStack(stackTrace: s);
      emit(CategoriesState.failure(e.toString()));
    }
  }

  void _onCategoryBack(CategoryBackEvent event, Emitter<CategoriesState> emit) {
    emit(CategoriesInitialState());
  }

  void _onAddExpensePressed(
    AddExpenseButtonPressedEvent event,
    Emitter<CategoriesState> emit,
  ) {
    emit(CategoriesAddExpenseState());
  }

  Future<void> _onLoadCategories(LoadCategoriesEvent event,
      Emitter<CategoriesState> emit,) async {
    emit(const CategoriesState.loading());

    try {
      final querySnapshot = await _firestore.collection('transactions').get();


      final List<CategoryTransactionDto> transactions = querySnapshot.docs
          .map((doc) {
        final data = doc.data();


        if (data['title'] == null || data['category'] == null ||
            data['amount'] == null) {
          return null;
        }


        return CategoryTransactionDtoFirestore.fromFirestore(doc);
      })
          .where((dto) => dto != null)
          .cast<CategoryTransactionDto>()
          .toList();


      transactions.sort((a, b) => b.timeAndDate!.compareTo(a.timeAndDate!));

      emit(
        CategoriesState.loaded(
          selectedIndex: -1,
          selectedCategory: CategoryEnum.more,
          filteredTransactions: transactions,
        ),
      );
    } catch (e, s) {
      debugPrint('Error loading transactions: $e');
      debugPrintStack(stackTrace: s);
      emit(CategoriesState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteTransaction(DeleteTransactionEvent event,
      Emitter<CategoriesState> emit,) async {
    try {
      await _firestore.collection('transactions').doc(event.id).delete();

      add(
        CategorySelectedEvent(
          state is CategoriesLoadedState
              ? (state as CategoriesLoadedState).selectedCategory
              : CategoryEnum.more,
          state is CategoriesLoadedState
              ? (state as CategoriesLoadedState).selectedIndex
              : -1,
        ),
      );
    } catch (e, s) {
      debugPrint('Error deleting transaction: $e');
      debugPrintStack(stackTrace: s);
      emit(CategoriesState.failure(e.toString()));
    }
  }

  void _onEditTransaction(EditTransactionEvent event,
      Emitter<CategoriesState> emit,) {
    emit(CategoriesState.editExpense(event.transaction));
  }

  Future<void> _onUpdateTransaction(UpdateTransactionEvent event,
      Emitter<CategoriesState> emit,) async {
    try {
      await _firestore
          .collection('transactions')
          .doc(event.id)
          .update(event.updatedData);

      add(
        CategorySelectedEvent(
          state is CategoriesLoadedState
              ? (state as CategoriesLoadedState).selectedCategory
              : CategoryEnum.more,
          state is CategoriesLoadedState
              ? (state as CategoriesLoadedState).selectedIndex
              : -1,
        ),
      );
    } catch (e, s) {
      debugPrint('Error updating transaction: $e');
      debugPrintStack(stackTrace: s);
      emit(CategoriesState.failure(e.toString()));
    }
  }
}
