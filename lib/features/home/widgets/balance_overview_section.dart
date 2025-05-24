import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BalanceOverviewSection extends StatelessWidget {
  const BalanceOverviewSection({
    super.key,
    required this.totalBalance,
    required this.totalExpense,
  });

  final double totalBalance;
  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 48, top: 20, right: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItem(
            icon: AppIcons.iconHomeIncome,
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
            icon: AppIcons.iconHomeExpense,
            label: 'Total Expense',
            value: '-\$${totalExpense.toStringAsFixed(2)}',
            valueColor: const Color(0xFF5050FF),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String icon,
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon, width: 12, height: 12),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        // const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
