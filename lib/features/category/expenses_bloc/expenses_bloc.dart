import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repository/expensese_repository.dart';
import 'expenses_state.dart';

part 'expenses_event.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository repository;

  ExpensesBloc(this.repository) : super(ExpensesState.initial()) {
    on<SaveExpenseEvent>(_onSaveExpense);
    on<LoadTotalExpenseEvent>(_onLoadTotalExpense);
  }

  Future<void> _onSaveExpense(
    SaveExpenseEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(ExpensesState.saving());

    try {
      await repository.addExpenseToCategory(
        category: event.category,
        timeAndDate: event.timeAndDate,
        amount: event.amount,
        title: event.title,
        message: event.message,
      );
      final updatedTotal = await repository.getTotalExpense();

      emit(ExpensesState.saved(totalExpense: updatedTotal));
    } catch (e) {
      emit(ExpensesState.failure(e.toString()));
    }
  }

  Future<void> _onLoadTotalExpense(LoadTotalExpenseEvent event,
      Emitter<ExpensesState> emit,) async {
    emit(ExpensesState.saving(
        totalExpense: state.totalExpense)); // можно показать загрузку

    try {
      final total = await repository.getTotalExpense();
      emit(ExpensesState.initial(totalExpense: total));
    } catch (e) {
      emit(ExpensesState.failure(
          e.toString(), totalExpense: state.totalExpense));
    }
  }
}
