import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../expense/expense_bloc/expense_bloc.dart';
import '../../expense/expense_bloc/expense_state.dart';
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
                child: BlocBuilder<ExpenseBloc, ExpenseState>(
                  builder: (context, state) {
                    return state.when(
                      initial: (totalExpense) => const SizedBox.shrink(),
                      loading:
                          (totalExpense, transactions) =>
                              const Center(child: CircularProgressIndicator()),
                      failure:
                          (message, totalExpense) =>
                              Center(child: Text('Error: $message')),
                      loaded: (
                        totalExpense,
                        transactions,
                        filteredTransactions,
                      ) {
                        if (transactions.isEmpty) {
                          return const Center(
                            child: Text('No transactions found'),
                          );
                        }
                        return TransactionTransactionsListSection(
                          transactions: transactions,
                        );
                      },
                    );
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
