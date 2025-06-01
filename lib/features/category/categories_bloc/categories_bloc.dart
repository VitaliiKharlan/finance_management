import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/category_mock_transactions.dart';
import 'categories_state.dart';

part 'categories_event.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitialState()) {
    on<CategorySelectedEvent>(_onCategorySelected);
    on<CategoryBackEvent>(_onCategoryBack);
  }

  void _onCategorySelected(
    CategorySelectedEvent event,
    Emitter<CategoriesState> emit,
  ) {
    try {
      final filtered =
          dummyTransactions
              .where(
                (t) => t.category.toLowerCase() == event.label.toLowerCase(),
              )
              .toList();

      emit(
        CategoriesLoadedState(
          selectedIndex: event.index,
          selectedCategory: event.label,
          filteredTransactions: filtered,
        ),
      );
    } catch (e, s) {
      debugPrint('Error filtering categories: $e');
      debugPrintStack(stackTrace: s);
      emit(CategoriesFailureState(e.toString()));
    }
  }

  void _onCategoryBack(CategoryBackEvent event, Emitter<CategoriesState> emit) {
    emit(CategoriesInitialState());
  }
}
