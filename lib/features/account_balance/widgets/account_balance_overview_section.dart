import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../expense/expense_bloc/expense_bloc.dart';
import '../../expense/expense_bloc/expense_state.dart';

class AccountBalanceOverviewSection extends StatelessWidget {
  const AccountBalanceOverviewSection({
    super.key,
    required this.totalBalance,
    required this.totalExpense,
  });

  final double totalBalance;
  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        double totalExpense = 0.0;
        double totalBalance = 0.0;

        if (state is ExpensesLoaded) {
          totalExpense = state.totalExpense;
          totalBalance = 10000.0 - totalExpense;
        }
        return Padding(
          padding: const EdgeInsets.only(left: 48, top: 20, right: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BalanceOverviewItem(
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
              _BalanceOverviewItem(
                icon: AppIcons.iconHomeExpense,
                label: 'Total Expense',
                value: '-\$${totalExpense.toStringAsFixed(2)}',
                valueColor: const Color(0xFF5050FF),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BalanceOverviewItem extends StatelessWidget {
  const _BalanceOverviewItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final String icon;
  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
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
