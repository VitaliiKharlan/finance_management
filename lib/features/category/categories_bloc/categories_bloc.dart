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

      final transactions =
          querySnapshot.docs.map((doc) {
            final data = doc.data();
            return CategoryTransactionDto.fromJson(data);
          }).toList();

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

  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(const CategoriesState.loading());

    try {
      final querySnapshot = await _firestore.collection('categories').get();

      final List<CategoryTransactionDto> transactions =
          querySnapshot.docs.map((doc) {
            final data = doc.data();
            return CategoryTransactionDto.fromJson(data);
          }).toList();

      transactions.sort((a, b) => b.timeAndDate!.compareTo(a.timeAndDate!));

      emit(
        CategoriesState.loaded(
          selectedIndex: -1,
          selectedCategory: CategoryEnum.more,
          filteredTransactions: transactions,
        ),
      );
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }
}
