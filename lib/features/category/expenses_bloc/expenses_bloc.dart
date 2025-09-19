import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../categories_bloc/categories_bloc.dart';
import '../repository/expenses_repository.dart';
import 'expenses_state.dart';

part 'expenses_event.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository repository;
  final CategoriesBloc categoriesBloc;

  ExpensesBloc({required this.repository, required this.categoriesBloc})
    : super(ExpensesState.initial()) {
    on<SaveExpenseEvent>(_onSaveExpense);
    on<DeleteExpenseEvent>(_onDeleteExpense);
    on<LoadTotalExpenseEvent>(_onLoadTotalExpense);
  }

  Future<void> _onSaveExpense(
    SaveExpenseEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(ExpensesState.saving(totalExpense: state.totalExpense));

    try {
      if (event.id != null) {
        await repository.updateExpense(
          id: event.id!,
          category: event.category,
          timeAndDate: event.timeAndDate,
          amount: event.amount,
          title: event.title,
          message: event.message,
        );
      } else {
        await repository.addExpenseToCategory(
          category: event.category,
          timeAndDate: event.timeAndDate,
          amount: event.amount,
          title: event.title,
          message: event.message,
        );
      }

      if (event.id != null) {
        final updatedTransaction = await repository.getTransactionById(
          event.id!,
        );
        if (updatedTransaction != null) {
          categoriesBloc.add(
            UpdateTransactionInCategoryEvent(updatedTransaction),
          );
        }
      }

      final updatedTotal = await repository.getTotalExpense();
      emit(ExpensesState.saved(totalExpense: updatedTotal));
    } catch (e) {
      emit(
        ExpensesState.failure(e.toString(), totalExpense: state.totalExpense),
      );
    }
  }

  Future<void> _onDeleteExpense(
    DeleteExpenseEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(ExpensesState.saving(totalExpense: state.totalExpense));

    try {
      await repository.deleteExpense(event.id);
      final updatedTotal = await repository.getTotalExpense();
      emit(ExpensesState.saved(totalExpense: updatedTotal));
    } catch (e) {
      emit(
        ExpensesState.failure(e.toString(), totalExpense: state.totalExpense),
      );
    }
  }

  Future<void> _onLoadTotalExpense(
    LoadTotalExpenseEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(ExpensesState.saving(totalExpense: state.totalExpense));

    try {
      final total = await repository.getTotalExpense();
      emit(ExpensesState.initial(totalExpense: total));
    } catch (e) {
      emit(
        ExpensesState.failure(e.toString(), totalExpense: state.totalExpense),
      );
    }
  }
}
