import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/category_enum.dart';
import '../models/category_transaction_dto.dart';
import 'categories_state.dart';

part 'categories_event.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final FirebaseFirestore _firestore;
  StreamSubscription<List<CategoryTransactionDto>>? _transactionsSub;

  CategoriesBloc({required FirebaseFirestore firestore})
    : _firestore = firestore,
      super(CategoriesInitialState()) {
    on<CategorySelectedEvent>(_onCategorySelected);
    on<CategoryBackEvent>(_onCategoryBack);
    on<AddExpenseButtonPressedEvent>(_onAddExpensePressed);
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<EditTransactionInCategoryEvent>(_onEditTransactionInCategory);
    on<DeleteTransactionInCategoryEvent>(_onDeleteTransactionInCategory);
    on<UpdateTransactionInCategoryEvent>(_onUpdateTransactionInCategory);

    on<_TransactionsUpdatedEvent>(_onTransactionsUpdated);

    add(LoadCategoriesEvent());
  }

  Future<void> _onCategorySelected(CategorySelectedEvent event,
      Emitter<CategoriesState> emit,) async {
    try {
      if (state is! CategoriesLoadedState) return;

      final allTransactions =
          (state as CategoriesLoadedState).filteredTransactions;

      final filteredTransactions =
          allTransactions.where((t) => t.category == event.category).toList();

      emit(
        CategoriesState.loaded(
          selectedIndex: event.index,
          selectedCategory: event.category,
          filteredTransactions: filteredTransactions,
        ),
      );
    } catch (e, s) {
      debugPrint('Error loading transactions: $e');
      debugPrintStack(stackTrace: s);
      emit(CategoriesState.failure(e.toString()));
    }
  }

  void _onCategoryBack(CategoryBackEvent event, Emitter<CategoriesState> emit) {
    if (state is CategoriesLoadedState) {
      final currentState = state as CategoriesLoadedState;
      emit(
        currentState.copyWith(
          selectedIndex: -1,
          selectedCategory: null,
        ),
      );
    } else {
      emit(CategoriesInitialState());
    }
  }

  void _onAddExpensePressed(AddExpenseButtonPressedEvent event,
      Emitter<CategoriesState> emit,) {
    emit(CategoriesAddExpenseState());
  }

  Future<void> _onLoadCategories(LoadCategoriesEvent event,
      Emitter<CategoriesState> emit,) async {
    emit(const CategoriesState.loading());

    try {
      await _transactionsSub?.cancel();

      _transactionsSub = _firestore
          .collection('transactions')
          .orderBy('date', descending: true)
          .snapshots()
          .map(
            (snapshot) =>
                snapshot.docs
                    .map(
                      (doc) =>
                          CategoryTransactionDtoFirestore.fromFirestore(doc),
                    )
                    .toList(),
          )
          .listen(
            (transactions) {
              add(_TransactionsUpdatedEvent(transactions));
            },
            onError: (error) {
              emit(CategoriesState.failure(error.toString()));
            },
          );
    } catch (e, s) {
      debugPrint('Error loading transactions: $e');
      debugPrintStack(stackTrace: s);
      emit(CategoriesState.failure(e.toString()));
    }
  }

  void _onEditTransactionInCategory(EditTransactionInCategoryEvent event,
      Emitter<CategoriesState> emit,) {
    emit(CategoriesAddExpenseState(transactionToEdit: event.transaction));
  }

  Future<void> _onDeleteTransactionInCategory(
    DeleteTransactionInCategoryEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    if (state is! CategoriesLoadedState) return;

    final currentState = state as CategoriesLoadedState;

    emit(const CategoriesState.loading());

    try {
      await _firestore.collection('transactions').doc(event.id).delete();

      final updatedTransactions =
          currentState.filteredTransactions
              .where((t) => t.id != event.id)
              .toList();

      emit(currentState.copyWith(filteredTransactions: updatedTransactions));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }

  void _onUpdateTransactionInCategory(UpdateTransactionInCategoryEvent event,
      Emitter<CategoriesState> emit,) {
    if (state is! CategoriesLoadedState) return;

    final currentState = state as CategoriesLoadedState;
    final updatedTransactions =
        currentState.filteredTransactions.map((t) {
          if (t.id == event.updatedTransaction.id) {
            return event.updatedTransaction;
          }
          return t;
        }).toList();

    emit(currentState.copyWith(filteredTransactions: updatedTransactions));
  }

  void _onTransactionsUpdated(
    _TransactionsUpdatedEvent event,
    Emitter<CategoriesState> emit,
  ) {
    if (state is CategoriesLoadedState) {
      final currentState = state as CategoriesLoadedState;
      final selectedCategory = currentState.selectedCategory;

      final filtered =
          selectedCategory != null
              ? event.transactions
                  .where((t) => t.category == selectedCategory)
                  .toList()
              : event.transactions;

      emit(currentState.copyWith(filteredTransactions: filtered));
    } else {
      emit(
        CategoriesState.loaded(
          selectedIndex: -1,
          selectedCategory: null,
          filteredTransactions: event.transactions,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _transactionsSub?.cancel();
    return super.close();
  }
}


