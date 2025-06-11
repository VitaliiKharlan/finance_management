import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../repository/expensese_repository.dart';
import 'expenses_state.dart';

part 'expenses_event.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository repository;

  ExpensesBloc(this.repository) : super(ExpensesState.initial()) {
    on<SaveExpenseEvent>(_onSaveExpense);
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
      emit(ExpensesState.saved());
    } catch (e) {
      emit(ExpensesState.failure(e.toString()));
    }
  }
}
