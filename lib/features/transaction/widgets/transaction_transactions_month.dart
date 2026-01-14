import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../data/transaction_data.dart';
import 'transaction_transactions_tile.dart';

class TransactionTransactionsMonth extends StatelessWidget {
  final String month;
  final List<TransactionData> transactions;
  final bool showMonthLabel;

  const TransactionTransactionsMonth({
    super.key,
    required this.month,
    required this.transactions,
    this.showMonthLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showMonthLabel)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              month,
              style: GoogleFonts.poppins(
                color: AppColors.lettersAndIcons,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ...transactions.map(
          (t) => TransactionTransactionsTile(
            svgAsset: t.svgAsset,
            title: t.title,
            timeAndDate: t.timeAmdDate,
            category: t.category,
            amount: t.amount,
            isExpense: t.isExpense,
          ),
        ),
      ],
    );
  }
}
