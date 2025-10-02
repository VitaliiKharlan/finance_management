import 'package:flutter/material.dart';

import '../../category/models/category_transaction_dto.dart';
import 'account_balance_transactions_list_transaction_tile.dart';

class AccountBalanceTransactionsListSection extends StatefulWidget {
  final List<CategoryTransactionDto> transactions;

  const AccountBalanceTransactionsListSection({
    super.key,
    required this.transactions,
  });

  @override
  State<AccountBalanceTransactionsListSection> createState() =>
      _AccountBalanceTransactionsListSectionState();
}

class _AccountBalanceTransactionsListSectionState
    extends State<AccountBalanceTransactionsListSection> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    if (widget.transactions.isEmpty) {
      return const Center(child: Text('No transactions found'));
    }

    final sortedTransactions = [...widget.transactions]
      ..sort((a, b) => b.timeAndDate!.compareTo(a.timeAndDate!));

    final limitedTransactions = sortedTransactions.take(4).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF093030),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showAll = !showAll;
                  });
                },
                child: Text(
                  showAll ? 'See less' : 'See all',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF093030),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!showAll)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                for (final transaction in limitedTransactions)
                  AccountBalanceTransactionsListTransactionTile(
                    svgAsset: transaction.category.iconPath,
                    category: transaction.category.shortLabel,
                    timeAndDate: transaction.timeAndDate!,
                    title: transaction.title,
                    amount: transaction.amount,
                    isExpense: transaction.amount > 0,
                  ),
              ],
            ),
          )
        else
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListView.builder(
                itemCount: sortedTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = sortedTransactions[index];
                  return AccountBalanceTransactionsListTransactionTile(
                    svgAsset: transaction.category.iconPath,
                    category: transaction.category.shortLabel,
                    timeAndDate: transaction.timeAndDate!,
                    title: transaction.title,
                    amount: transaction.amount,
                    isExpense: transaction.amount > 0,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
