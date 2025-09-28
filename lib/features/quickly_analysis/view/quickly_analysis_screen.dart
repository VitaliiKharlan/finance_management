import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../expense/expense_bloc/expense_bloc.dart';
import '../../expense/expense_bloc/expense_state.dart';
import '../widgets/quickly_analysis_balance_card_section.dart';
import '../widgets/quickly_analysis_chart_section.dart';
import '../widgets/quickly_analysis_expenses_list_section.dart';
import '../widgets/quickly_analysis_header_section.dart';

@RoutePage()
class QuicklyAnalysisScreen extends StatelessWidget {
  const QuicklyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: SafeArea(
        child: Column(
          children: [
            const QuicklyAnalysisHeaderSection(),
            const QuicklyAnalysisBalanceCardSection(),

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

                child: Column(
                  children: [
                    QuicklyAnalysisChartSection(),
                    SizedBox(height: 20),
                    BlocBuilder<ExpenseBloc, ExpenseState>(
                      builder: (context, state) {
                        if (state is ExpensesLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
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

                          return QuicklyAnalysisExpensesListSection(
                            transactions: transactions,
                          );
                        }
                        return const SizedBox.shrink();
                      },
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
