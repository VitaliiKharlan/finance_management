import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/category_enum.dart';
import '../../category/models/category_transaction_dto.dart';
import '../repository/i_expense_repository.dart';
import 'expense_state.dart';

part 'expense_event.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final IExpenseRepository repository;

  List<CategoryTransactionDto> _allTransactions = [];
  int _selectedPeriodIndex = 0;
  List<CategoryTransactionDto> _foodLastWeekTransactions = [];
  double _totalFoodLastWeekExpense = 0;

  StreamSubscription<List<CategoryTransactionDto>>? _transactionsSub;

  List<CategoryTransactionDto> get foodLastWeekTransactions =>
      _foodLastWeekTransactions;

  ExpenseBloc({required this.repository}) : super(ExpenseState.initial()) {
    on<SaveExpenseEvent>(_onSaveExpense);
    on<DeleteExpenseEvent>(_onDeleteExpense);
    on<LoadExpensesEvent>(_onLoadExpenses);
    on<LoadTotalExpensesEvent>(_onLoadTotalExpense);
    on<ExpensesPeriodChanged>(_onExpensesPeriodChanged);
    on<_TransactionsUpdated>(_onTransactionsUpdated);

    _transactionsSub = repository.getTransactionsStream().listen(
          (transactions) {
        add(_TransactionsUpdated(transactions));
      },
      onError: (error) {
        add(_TransactionsErrorOccurred(error.toString()));
      },
    );

    on<_TransactionsErrorOccurred>((event, emit) {
      emit(ExpenseState.failure(
          event.errorMessage, totalExpense: state.totalExpense));
    });
  }

  /// Добавление или обновление транзакции
  Future<void> _onSaveExpense(SaveExpenseEvent event,
      Emitter<ExpenseState> emit,) async {
    try {
      if (event.transaction.id.isEmpty) {
        await repository.addExpense(event.transaction);
      } else {
        await repository.updateExpense(event.transaction.id, event.transaction);
      }

      _allTransactions = await repository.getAllTransactions();
      _emitFiltered(emit);
    } catch (e) {
      emit(
          ExpenseState.failure(e.toString(), totalExpense: state.totalExpense));
    }
  }

  /// Удаление транзакции
  Future<void> _onDeleteExpense(DeleteExpenseEvent event,
      Emitter<ExpenseState> emit,) async {
    try {
      await repository.deleteExpense(event.id);

      _allTransactions = await repository.getAllTransactions();
      _emitFiltered(emit);
    } catch (e) {
      emit(
          ExpenseState.failure(e.toString(), totalExpense: state.totalExpense));
    }
  }

  /// Загрузка всех транзакций
  Future<void> _onLoadExpenses(LoadExpensesEvent event,
      Emitter<ExpenseState> emit,) async {
    emit(ExpenseState.loading(
      transactions: state is ExpensesLoaded
          ? (state as ExpensesLoaded).transactions
          : const [],
    ));

    try {
      _allTransactions = await repository.getAllTransactions();
      _emitFiltered(emit);
    } catch (e) {
      emit(ExpenseState.failure(e.toString()));
    }
  }

  /// Загрузка суммы всех транзакций
  Future<void> _onLoadTotalExpense(LoadTotalExpensesEvent event,
      Emitter<ExpenseState> emit,) async {
    try {
      final total = await repository.getTotalExpense();
      _emitFiltered(emit, total: total);
    } catch (e) {
      emit(
          ExpenseState.failure(e.toString(), totalExpense: state.totalExpense));
    }
  }

  /// Смена периода фильтрации транзакций
  Future<void> _onExpensesPeriodChanged(ExpensesPeriodChanged event,
      Emitter<ExpenseState> emit,) async {
    _selectedPeriodIndex = event.selectedPeriodIndex;
    _emitFiltered(emit);
  }

  /// Обновление списка транзакций из потока репозитория
  Future<void> _onTransactionsUpdated(_TransactionsUpdated event,
      Emitter<ExpenseState> emit,) async {
    _allTransactions = event.transactions;
    final total = _allTransactions.fold<double>(0, (sum, t) => sum + t.amount);
    _emitFiltered(emit, total: total);
  }

  /// Обновление списка еды за последнюю неделю
  void _updateFoodLastWeek() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final weekStart = today.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 7));

    _foodLastWeekTransactions =
        _allTransactions.where((t) {
          final date = t.timeAndDate!;
          return t.category == CategoryEnum.food &&
              date.isAfter(weekStart.subtract(const Duration(seconds: 1))) &&
              date.isBefore(weekEnd.add(const Duration(seconds: 1)));
        }).toList();

    _totalFoodLastWeekExpense =
        _foodLastWeekTransactions.fold<double>(0, (sum, t) => sum + t.amount);
  }

  /// Фильтрация транзакций по периоду
  void _emitFiltered(Emitter<ExpenseState> emit, {double? total}) {
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

    final totalExpense =
        total ?? _allTransactions.fold<double>(0, (sum, t) => sum + t.amount);
    _updateFoodLastWeek();

    emit(
      ExpenseState.loaded(
        totalExpense: totalExpense,
        totalFoodLastWeekExpense: _totalFoodLastWeekExpense,
        transactions: _allTransactions,
        filteredTransactions: filtered,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _transactionsSub?.cancel();
    return super.close();
  }
}