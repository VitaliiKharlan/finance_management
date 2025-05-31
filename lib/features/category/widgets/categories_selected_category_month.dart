import 'package:flutter/material.dart';

import '../../transaction/widgets/transaction_transactions_tile.dart';
import 'category.data.dart';

class CategoriesSelectedCategoryMonth extends StatelessWidget {
  final String month;
  final List<CategoryData> transactions;
  final bool showMonthLabel;

  const CategoriesSelectedCategoryMonth({
    super.key,
    required this.month,
    required this.transactions,
    this.showMonthLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showMonthLabel)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              month,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ...transactions.map(
          (t) => TransactionTransactionsTile(
            svgAsset: t.svgAsset,
            title: t.title,
            subtitle: t.subtitle,
            category: t.category,
            amount: t.amount,
            isExpense: t.isExpense,
          ),
        ),
      ],
    );
  }
}
