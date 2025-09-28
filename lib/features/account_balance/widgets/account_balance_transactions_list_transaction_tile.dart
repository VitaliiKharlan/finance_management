import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';

class AccountBalanceTransactionsListTransactionTile extends StatelessWidget {
  final String svgAsset;
  final String category;
  final DateTime dateTime;
  final String title;
  final double amount;
  final bool isExpense;

  const AccountBalanceTransactionsListTransactionTile({
    super.key,
    required this.svgAsset,
    required this.category,
    required this.dateTime,
    required this.title,
    required this.amount,
    this.isExpense = true,
  });

  static const double _leadingWidth = 60;
  static const double _titleWidth = 92;
  static const double _dividerLeftMargin = 4;
  static const double _categoryWidth = 72;
  static const double _dividerRightMargin = 4;
  static const double _amountWidth = 72;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        // horizontal: 4,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _leadingWidth,
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

          const SizedBox(width: 16),

          SizedBox(
            width: _titleWidth,
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
                  DateFormat('dd MMM yyyy, HH:mm').format(dateTime),
                  style: GoogleFonts.poppins(
                    color: AppColors.oceanBlueButton,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          const SizedBox(width: _dividerLeftMargin),

          Container(width: 1, height: 32, color: Colors.grey.shade400),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: _categoryWidth,
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

          const SizedBox(width: _dividerRightMargin),

          Container(width: 1, height: 32, color: Colors.grey.shade400),

          SizedBox(
            width: _amountWidth,
            child: Text(
              '${isExpense ? '-' : ''}${NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(amount)}',
              // amount,
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
