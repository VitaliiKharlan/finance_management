import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';

class QuicklyAnalysisExpenseTile extends StatelessWidget {
  final String svgAsset;
  final String category;
  final DateTime timeAndDate;
  final String title;
  final double amount;
  final bool isExpense;

  const QuicklyAnalysisExpenseTile({
    super.key,
    required this.svgAsset,
    required this.category,
    required this.timeAndDate,
    required this.title,
    required this.amount,
    this.isExpense = true,
  });

  static const double _categoryIconWidth = 68;
  static const double _categoryNameAndTimeAndDateWidth = 112;
  static const double _dividerLeftWidth = 2;
  static const double _transactionTitleWidth = 76;
  static const double _dividerRightWidth = 2;
  static const double _amountWidth = 68;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _categoryIconWidth,
            child: Container(
              width: 57,
              height: 53,
              decoration: BoxDecoration(
                color:
                    isExpense
                        ? const Color(0xFF6DB6FE)
                        : const Color(0xFF0068FF),
                borderRadius: BorderRadius.circular(22),
              ),
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(svgAsset, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: _categoryNameAndTimeAndDateWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category,
                  style: GoogleFonts.poppins(
                    color: AppColors.backgroundDarkModeAndLetters,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('HH:mm - MMMM dd').format(timeAndDate),
                  style: GoogleFonts.poppins(
                    color: AppColors.oceanBlueButton,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: _dividerLeftWidth),
          Container(width: 1, height: 32, color: Colors.grey.shade400),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: _transactionTitleWidth,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const SizedBox(width: _dividerRightWidth),
          Container(width: 1, height: 32, color: Colors.grey.shade400),
          SizedBox(
            width: _amountWidth,
            child: Text(
              '${isExpense ? '-' : ''}${NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(amount)}',
              style: GoogleFonts.poppins(
                color:
                    isExpense
                        ? AppColors.oceanBlueButton
                        : AppColors.backgroundDarkModeAndLetters,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
