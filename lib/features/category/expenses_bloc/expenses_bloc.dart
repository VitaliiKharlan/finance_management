import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/category_transaction_dto.dart';
import '../repository/expenses_repository.dart';
import 'expenses_state.dart';

part 'expenses_event.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository repository;

  ExpensesBloc({required this.repository}) : super(ExpensesState.initial()) {
    on<SaveExpenseEvent>(_onSaveExpense);
    on<DeleteExpenseEvent>(_onDeleteExpense);
    on<LoadExpensesEvent>(_onLoadExpenses);
    on<LoadTotalExpenseEvent>(_onLoadTotalExpense);
    on<_TransactionsUpdated>(_onTransactionsUpdated);

    repository.getTransactionsStream().listen((transactions) {
      add(_TransactionsUpdated(transactions));
    });
  }

  Future<void> _onSaveExpense(
    SaveExpenseEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    try {
      if (event.transaction.id.isEmpty) {
        await repository.addExpense(event.transaction);
      } else {
        await repository.updateExpense(event.transaction.id, event.transaction);
      }

      final transactions = await repository.getAllTransactions();
      final total = await repository.getTotalExpense();

      emit(
        ExpensesState.loaded(transactions: transactions, totalExpense: total),
      );
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
    try {
      await repository.deleteExpense(event.id);
    } catch (e) {
      emit(
        ExpensesState.failure(e.toString(), totalExpense: state.totalExpense),
      );
    }
  }

  Future<void> _onLoadExpenses(
    LoadExpensesEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    emit(
      ExpensesState.loading(
        transactions:
            state is ExpensesLoaded
                ? (state as ExpensesLoaded).transactions
                : const [],
      ),
    );

    try {
      final transactions = await repository.getAllTransactions();
      final total = await repository.getTotalExpense();
      emit(
        ExpensesState.loaded(transactions: transactions, totalExpense: total),
      );
    } catch (e) {
      emit(ExpensesState.failure(e.toString()));
    }
  }

  Future<void> _onLoadTotalExpense(
    LoadTotalExpenseEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    try {
      final total = await repository.getTotalExpense();
      final transactions = await repository.getAllTransactions();

      emit(
        ExpensesState.loaded(transactions: transactions, totalExpense: total),
      );
    } catch (e) {
      emit(
        ExpensesState.failure(e.toString(), totalExpense: state.totalExpense),
      );
    }
  }

  Future<void> _onTransactionsUpdated(
    _TransactionsUpdated event,
    Emitter<ExpensesState> emit,
  ) async {
    final total = event.transactions.fold<double>(
      0,
      (sum, t) => sum + t.amount,
    );
    emit(
      ExpensesState.loaded(
        transactions: event.transactions,
        totalExpense: total,
      ),
    );
  }
}
