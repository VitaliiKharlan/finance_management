import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/transaction_balance_section.dart';
import '../widgets/transaction_header_section.dart';
import '../widgets/transaction_transactions_list_section.dart';

@RoutePage()
class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      body: SafeArea(
        child: Column(
          children: [
            TransactionsHeaderSection(),
            TransactionsBalanceSection(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundGreenWhiteAndLetters,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: const TransactionTransactionsListSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
