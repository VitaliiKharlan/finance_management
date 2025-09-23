import 'package:auto_route/auto_route.dart';
import 'package:finance_management/core/enums/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../expense/expense_bloc/expense_bloc.dart';
import '../../expense/expense_bloc/expense_state.dart';
import '../../expense/view/expense_add_expenses.dart';
import '../categories_bloc/categories_bloc.dart';
import '../categories_bloc/categories_state.dart';
import '../widgets/categories_balance_overview_section.dart';
import '../widgets/categories_expense_progress_bar_widget_section.dart';
import '../widgets/categories_header_section.dart';
import '../widgets/categories_main_section.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, categoriesState) {
        return BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (context, expensesState) {
            final totalExpense = expensesState.totalExpense;
            Widget bodyContent;

            if (categoriesState is CategoriesInitialState ||
                categoriesState is CategoriesLoadedState) {
              bodyContent = Column(
                children: [
                  const CategoriesHeaderSection(),
                  CategoriesBalanceOverviewSection(
                    totalBalance: 7783.00,
                    totalExpense: totalExpense,
                  ),
                  const CategoriesExpenseProgressBarWidgetSection(
                    percentage: 0.3,
                    limitAmount: 20000.00,
                  ),
                  CategoriesMainSection(categories: CategoryEnum.values),
                ],
              );
            } else if (categoriesState is CategoriesAddExpenseState) {
              bodyContent = Column(
                children: [
                  const CategoriesHeaderSection(),
                  const SizedBox(height: 40),
                  ExpenseAddExpenses(
                    transactionToEdit: categoriesState.transactionToEdit,
                  ),
                ],
              );
            } else if (categoriesState is CategoriesFailureState) {
              bodyContent = Center(
                child: Text('Error: ${categoriesState.message}'),
              );
            } else {
              bodyContent = const Center(child: CircularProgressIndicator());
            }

            return Scaffold(
              backgroundColor: const Color(0xFF00D09E),
              body: SafeArea(child: bodyContent),
            );
          },
        );
      },
    );
  }
}
