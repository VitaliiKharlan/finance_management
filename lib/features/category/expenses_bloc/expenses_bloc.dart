import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/category_transaction_dto.dart';
import '../repository/expenses_repository.dart';
import 'expenses_state.dart';

part 'expenses_event.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final ExpensesRepository repository;

  List<CategoryTransactionDto> _allTransactions = [];
  int _selectedPeriodIndex = 0;

  ExpensesBloc({required this.repository}) : super(ExpensesState.initial()) {
    on<SaveExpenseEvent>(_onSaveExpense);
    on<DeleteExpenseEvent>(_onDeleteExpense);
    on<LoadExpensesEvent>(_onLoadExpenses);
    on<LoadTotalExpenseEvent>(_onLoadTotalExpense);
    on<ExpensesPeriodChanged>(_onExpensesPeriodChanged);
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

      _allTransactions = await repository.getAllTransactions();

      // Считаем общий расход (для TransactionScreen)


      // Эмитим фильтрованный список сразу
      _emitFiltered(emit);
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
      _allTransactions = await repository.getAllTransactions();


      // Эмитим с фильтрацией сразу
      _emitFiltered(emit);
    } catch (e) {
      emit(ExpensesState.failure(e.toString()));
    }
  }

  Future<void> _onLoadTotalExpense(
    LoadTotalExpenseEvent event,
    Emitter<ExpensesState> emit,
  ) async {
    try {
      _allTransactions = await repository.getAllTransactions();


      // Эмитим с фильтрацией сразу
      _emitFiltered(emit);
    } catch (e) {
      emit(
        ExpensesState.failure(e.toString(), totalExpense: state.totalExpense),
      );
    }
  }

  Future<void> _onExpensesPeriodChanged(ExpensesPeriodChanged event,
      Emitter<ExpensesState> emit,) async {
    _selectedPeriodIndex = event.selectedPeriodIndex;
    _emitFiltered(emit);
  }

  Future<void> _onTransactionsUpdated(_TransactionsUpdated event,
      Emitter<ExpensesState> emit,) async {
    _allTransactions = event.transactions;
    final total = _allTransactions.fold<double>(0, (sum, t) => sum + t.amount);

    // Сразу используем фильтр, чтобы получить filteredTransactions
    _emitFiltered(emit, total: total);
  }

  void _emitFiltered(Emitter<ExpensesState> emit, {double? total}) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    List<CategoryTransactionDto> filtered;

    switch (_selectedPeriodIndex) {
      case 0: // Daily
        filtered = _allTransactions.where((t) {
          final date = t.timeAndDate!;
          return date.year == now.year &&
              date.month == now.month &&
              date.day == now.day;
        }).toList();
        break;

      case 1: // Weekly
        final weekStart = today.subtract(Duration(days: now.weekday - 1));
        final weekEnd = weekStart.add(const Duration(days: 7));
        filtered = _allTransactions.where((t) {
          final date = t.timeAndDate!;
          return date.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
              date.isBefore(weekEnd.add(const Duration(seconds: 1)));
        }).toList();
        break;

      case 2: // Monthly
        final monthStart = DateTime(now.year, now.month, 1);
        final nextMonth = (now.month == 12)
            ? DateTime(now.year + 1, 1, 1)
            : DateTime(now.year, now.month + 1, 1);
        final monthEnd = nextMonth.subtract(const Duration(seconds: 1));
        filtered = _allTransactions.where((t) {
          final date = t.timeAndDate!;
          return date.isAfter(
              monthStart.subtract(const Duration(seconds: 1))) &&
              date.isBefore(monthEnd.add(const Duration(seconds: 1)));
        }).toList();
        break;

      default:
        filtered = _allTransactions;
    }

    final total = _allTransactions.fold<double>(0, (sum, t) => sum + t.amount);

    emit(
      ExpensesState.loaded(
        transactions: _allTransactions,
        filteredTransactions: filtered,
        totalExpense: total,
      ),
    );
  }
}
