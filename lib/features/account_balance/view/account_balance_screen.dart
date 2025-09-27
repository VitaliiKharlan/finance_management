import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../expense/expense_bloc/expense_bloc.dart';
import '../../expense/expense_bloc/expense_state.dart';
import '../widgets/account_balance_balance_section.dart';
import '../widgets/account_balance_expense_progress_bar_widget.dart';
import '../widgets/account_balance_header_section.dart';
import '../widgets/account_balance_overview_section.dart';
import '../widgets/account_balance_transactions_list_section.dart';

@RoutePage()
class AccountBalanceScreen extends StatelessWidget {
  const AccountBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: SafeArea(
        child: Column(
          children: [
            const AccountBalanceHeaderSection(),
            const AccountBalanceOverviewSection(
              totalBalance: 7783.00,
              totalExpense: 1187.40,
            ),
            const AccountBalanceExpenseProgressBarWidget(
              percentage: 0.3,
              limitAmount: 20000.00,
            ),
            AccountBalanceBalanceSection(
              // percentage: 0.3,
            ),
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
                child: BlocBuilder<ExpenseBloc, ExpenseState>(
                  builder: (context, state) {
                    if (state is ExpensesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is ExpensesFailure) {
                      return Center(child: Text('Error: ${state.message}'));
                    }

                    if (state is ExpensesLoaded) {
                      final transactions = state.transactions;

                      if (transactions.isEmpty) {
                        return const Center(
                          child: Text('No transactions found'),
                        );
                      }

                      return AccountBalanceTransactionsListSection(
                        transactions: transactions,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

