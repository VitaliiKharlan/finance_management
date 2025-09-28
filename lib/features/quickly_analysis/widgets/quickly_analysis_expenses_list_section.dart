import 'package:flutter/material.dart';

import '../../category/models/category_transaction_dto.dart';
import 'quickly_analysis_expense_tile.dart';

class QuicklyAnalysisExpensesListSection extends StatelessWidget {
  final List<CategoryTransactionDto> transactions;

  const QuicklyAnalysisExpensesListSection({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(child: Text('No transactions found'));
    }

    final sortedTransactions = [...transactions]
      ..sort((a, b) => b.timeAndDate!.compareTo(a.timeAndDate!));

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: sortedTransactions.length,
          itemBuilder: (context, index) {
            final transaction = sortedTransactions[index];
            return QuicklyAnalysisExpenseTile(
              svgAsset: transaction.category.iconPath,
              category: transaction.category.shortLabel,
              dateTime: transaction.timeAndDate!,
              title: transaction.title,
              amount: transaction.amount,
              isExpense: transaction.amount > 0,
            );
          },
        ),
      ),
    );
  }
}
