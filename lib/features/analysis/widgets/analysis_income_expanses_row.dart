import 'package:finance_management/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_icons.dart';

class AnalysisIncomeExpensesRow extends StatelessWidget {
  const AnalysisIncomeExpensesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 24),
      child: Column(children: const [BalanceRowCard()]),
    );
  }
}

class BalanceRowCard extends StatelessWidget {
  const BalanceRowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: BalanceCard(
                icon: SvgPicture.asset(AppIcons.iconTransactionIncome),
                label: 'Income',
                value: '\$4,120.00',
                valueColor: AppColors.lettersAndIcons,
                valueFontWeight: FontWeight.w700,
                color: AppColors.lettersAndIcons,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BalanceCard(
                icon: SvgPicture.asset(AppIcons.iconTransactionExpense),
                label: 'Expense',
                value: '\$1,187.40',
                valueColor: AppColors.oceanBlueButton,
                valueFontWeight: FontWeight.w400,
                color: AppColors.oceanBlueButton,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          'My Targets',
          style: GoogleFonts.poppins(
            color: AppColors.lettersAndIcons,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
    required this.valueFontWeight,
    required this.color,
  });

  final Widget icon;
  final String label;
  final String value;
  final Color valueColor;
  final FontWeight valueFontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.backgroundGreenWhiteAndLetters,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            label,
            style: GoogleFonts.poppins(
              color: AppColors.lettersAndIcons,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: valueColor,
              fontSize: 20,
              fontWeight: valueFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
