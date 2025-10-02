import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../category/models/category_transaction_dto.dart';
import '../data/transaction_data.dart';
import 'transaction_transactions_header_with_calendar.dart';
import 'transaction_transactions_month.dart';

class TransactionTransactionsListSection extends StatelessWidget {
  final List<CategoryTransactionDto> transactions;

  const TransactionTransactionsListSection({
    super.key,
    required this.transactions,
  });

  TransactionData _mapTransaction(CategoryTransactionDto t) {
    return TransactionData(
      svgAsset: t.category.iconPath,
      category: t.category.shortLabel,
      timeAmdDate: t.timeAndDate!,
      title: t.title,
      amount: t.amount,
      isExpense: t.amount > 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(child: Text('No transactions found'));
    }

    final grouped = groupBy(transactions, (CategoryTransactionDto t) {
      return DateFormat('MMMM yyyy').format(t.timeAndDate!);
    });

    final groupedEntries = grouped.entries.toList();

    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: [
        TransactionTransactionsHeaderWithCalendar(
          monthName: groupedEntries[0].key,
        ),

        ...groupedEntries.mapIndexed((index, entry) {
          final month = entry.key;
          final monthTransactions = entry.value.map(_mapTransaction).toList();

          return TransactionTransactionsMonth(
            month: month,
            transactions: monthTransactions,
            showMonthLabel: index != 0,
          );
        }),
      ],
    );
  }
}

