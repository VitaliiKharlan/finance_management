import 'package:flutter/material.dart';

class BalanceSummaryWidget extends StatelessWidget {
  final double totalBalance;
  final double totalExpense;

  const BalanceSummaryWidget({
    super.key,
    required this.totalBalance,
    required this.totalExpense,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItem(
            label: 'Total Balance',
            value: '\$${totalBalance.toStringAsFixed(2)}',
            valueColor: Colors.white,
          ),
          Container(
            height: 40,
            width: 2,
            color: Colors.white24,
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          _buildItem(
            label: 'Total Expense',
            value: '-\$${totalExpense.toStringAsFixed(2)}',
            valueColor: const Color(0xFF5050FF),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
