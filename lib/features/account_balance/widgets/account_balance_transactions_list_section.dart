import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../category/models/category_transaction_dto.dart';
import '../../transaction/data/transaction_data.dart';
import 'account_balance_transactions_list_transaction_tile.dart';

class AccountBalanceTransactionsListSection extends StatelessWidget {
  final List<CategoryTransactionDto> transactions;

  const AccountBalanceTransactionsListSection({
    super.key,
    required this.transactions,
  });

  TransactionData _mapTransaction(CategoryTransactionDto t) {
    return TransactionData(
      svgAsset: t.category.iconPath,
      title: t.category.shortLabel,
      subtitle: DateFormat('HH:mm - MMM dd').format(t.timeAndDate!),
      category: t.title,
      amount: t.amount,
      isExpense: t.amount > 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(child: Text('No transactions found'));
    }

    final sortedTransactions = [...transactions]
      ..sort((a, b) => b.timeAndDate!.compareTo(a.timeAndDate!));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF093030),
                ),
              ),
              InkWell(
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF093030),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sortedTransactions.length,
            itemBuilder: (context, index) {
              return AccountBalanceTransactionsListTransactionTile(
                svgAsset: sortedTransactions[index].category.iconPath,
                title: sortedTransactions[index].category.shortLabel,
                dateTime: sortedTransactions[index].timeAndDate!,
                category: sortedTransactions[index].category,
                amount: sortedTransactions[index].amount,
                isExpense: sortedTransactions[index].amount > 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
