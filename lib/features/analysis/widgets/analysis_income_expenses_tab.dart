import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class AnalysisIncomeExpensesTab extends StatelessWidget {
  const AnalysisIncomeExpensesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Income & Expenses',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lettersAndIcons,
                ),
              ),
              Row(
                children: [
                  _IconButton(
                    assetPath: AppIcons.iconAnalysisSearch,
                    iconWidth: 24,
                    iconHeight: 24,
                    padding: EdgeInsets.only(top: 6),
                  ),
                  const SizedBox(width: 8),
                  _IconButton(assetPath: AppIcons.iconAnalysisCalendar),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Chart Placeholder
          SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _Bar(day: 'Mon', income: 6000, expense: 4000),
                _Bar(day: 'Tue', income: 2000, expense: 1000),
                _Bar(day: 'Wed', income: 8000, expense: 5000),
                _Bar(day: 'Thu', income: 3000, expense: 6000),
                _Bar(day: 'Fri', income: 10000, expense: 7000),
                _Bar(day: 'Sat', income: 1000, expense: 6000),
                _Bar(day: 'Sun', income: 5000, expense: 2000),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final String assetPath;
  final double iconWidth;
  final double iconHeight;
  final EdgeInsetsGeometry padding;

  const _IconButton({
    required this.assetPath,
    this.iconWidth = 18,
    this.iconHeight = 16,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.mainGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: padding,
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: iconWidth,
            height: iconHeight,
            colorFilter: const ColorFilter.mode(
              AppColors.lettersAndIcons,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final String day;
  final double income;
  final double expense;

  const _Bar({required this.day, required this.income, required this.expense});

  @override
  Widget build(BuildContext context) {
    const double maxBarHeight = 120;
    const double maxValue = 15000;

    final incomeHeight = (income / maxValue) * maxBarHeight;
    final expenseHeight = (expense / maxValue) * maxBarHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 6,
              height: incomeHeight,
              decoration: BoxDecoration(
                color: const Color(0xFF00C566),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 6,
              height: expenseHeight,
              decoration: BoxDecoration(
                color: const Color(0xFF0068FF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(day, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
