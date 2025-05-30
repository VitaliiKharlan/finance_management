import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';

class CategoriesBalanceOverviewSection extends StatelessWidget {
  const CategoriesBalanceOverviewSection({
    super.key,
    required this.totalBalance,
    required this.totalExpense,
  });

  final double totalBalance;
  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48, top: 8, right: 48, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BalanceOverviewItem(
            icon: AppIcons.iconCategoriesIncome,
            label: 'Total Balance',
            value: '\$${totalBalance.toStringAsFixed(2)}',
            valueColor: AppColors.backgroundGreenWhiteAndLetters,
          ),
          Container(
            height: 40,
            width: 2,
            color: Colors.white24,
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          _BalanceOverviewItem(
            icon: AppIcons.iconCategoriesExpense,
            label: 'Total Expense',
            value: '-\$${totalExpense.toStringAsFixed(2)}',
            valueColor: AppColors.oceanBlueButton,
            valueFontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class _BalanceOverviewItem extends StatelessWidget {
  const _BalanceOverviewItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
    this.valueFontWeight = FontWeight.bold,
  });

  final String icon;
  final String label;
  final String value;
  final Color valueColor;
  final FontWeight valueFontWeight;

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
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: valueColor,
            fontSize: 24,
            fontWeight: valueFontWeight,
          ),
        ),
      ],
    );
  }
}
