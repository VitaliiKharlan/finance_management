import 'package:auto_route/auto_route.dart';
import 'package:finance_management/features/analysis/widgets/analysis_tab_selector.dart';
import 'package:flutter/material.dart';

import '../widgets/analysis_balance_overview_section.dart';
import '../widgets/analysis_expense_progress_bar_widget.dart';
import '../widgets/analysis_header_section.dart';
import '../widgets/analysis_income_expanses_row.dart';
import '../widgets/analysis_income_expenses_tab.dart';

@RoutePage()
class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00D09E),
      body: SafeArea(
        child: Column(
          children: [
            const AnalysisHeaderSection(),
            const AnalysisBalanceOverviewSection(
              totalBalance: 7783.00,
              totalExpense: 1187.40,
            ),
            const AnalysisExpenseProgressBarWidget(
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
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 4,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AnalysisTabSelector(),
                      SizedBox(height: 8),
                      AnalysisIncomeExpensesTab(),
                      SizedBox(height: 8),
                      AnalysisIncomeExpensesRow(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
