import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class TransactionTransactionsHeaderWithCalendar extends StatelessWidget {
  final String monthName;

  const TransactionTransactionsHeaderWithCalendar({
    super.key,
    required this.monthName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            monthName,
            style: GoogleFonts.poppins(
              color: AppColors.lettersAndIcons,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: implement calendar
            },
            child: Container(
              width: 32,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.mainGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcons.iconTransactionCalendar,
                width: 18,
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
