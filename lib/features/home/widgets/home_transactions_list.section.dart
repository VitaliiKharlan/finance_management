import 'package:flutter/material.dart';

import '../../category/models/category_transaction_dto.dart';
import 'home_transactions_list_transaction_tile.dart';

class HomeTransactionsListSection extends StatelessWidget {
  final List<CategoryTransactionDto> transactions;

  const HomeTransactionsListSection({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(child: Text('No transactions found'));
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final t = transactions[index];
        return HomeTransactionsListTransactionTile(
          svgAsset: t.category.iconPath,
          title: t.title,
          dateTime: t.timeAndDate!,
          category: t.category,
          amount: t.amount,
          isExpense: t.amount > 0,
        );
      },
    );
  }
}
