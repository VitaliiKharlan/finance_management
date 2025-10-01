import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../expense/expense_bloc/expense_bloc.dart';
import '../../expense/expense_bloc/expense_state.dart';
import '../widgets/home_balance_overview_section.dart';
import '../widgets/home_expense_progress_bar_widget.dart';
import '../widgets/home_header_section.dart';
import '../widgets/home_savings_section.dart';
import '../widgets/home_tab_selector_section.dart';
import '../widgets/home_transactions_list.section.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderSection(),
            const HomeBalanceOverviewSection(
              totalBalance: 7783.00,
              totalExpense: 1187.40,
            ),
            const HomeExpenseProgressBarWidget(
              percentage: 0.3,
              limitAmount: 20000.00,
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF1FFF3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeSavingsSection(),
                    const SizedBox(height: 8),
                    const HomeTabSelectorSection(),

                    Expanded(
                      child: BlocBuilder<ExpenseBloc, ExpenseState>(
                        builder: (context, state) {
                          return state.when(
                            initial: (totalExpense) => const SizedBox.shrink(),
                            loading:
                                (totalExpense, transactions) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
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
                              return HomeTransactionsListSection(
                                transactions: filteredTransactions,
                              );
                            },
                            failure:
                                (message, totalExpense) =>
                                    Center(child: Text('Error: $message')),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
