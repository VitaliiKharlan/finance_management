import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/enums/category_enum.dart';
import '../../../core/theme/app_colors.dart';

class CategoriesSelectedCategoryTile extends StatelessWidget {
  final String svgAsset;
  final String title;
  final DateTime timeAndDate;
  final CategoryEnum category;

  final double amount;
  final bool isExpense;

  const CategoriesSelectedCategoryTile({
    super.key,
    required this.svgAsset,
    required this.title,
    required this.timeAndDate,
    required this.category,
    required this.amount,
    this.isExpense = true,
  });

  static const double _leadingWidth = 60;
  static const double _titleWidth = 180;
  static const double _amountWidth = 72;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                  title,
                  style: GoogleFonts.poppins(
                    color: AppColors.backgroundDarkModeAndLetters,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('dd MMM yyyy, HH:mm').format(timeAndDate),
                  style: GoogleFonts.poppins(
                    color: AppColors.oceanBlueButton,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: _amountWidth,
            child: Text(
              '${isExpense ? '-' : ''}${NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(amount)}',
              style: TextStyle(
                color: isExpense ? Colors.blue : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
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
