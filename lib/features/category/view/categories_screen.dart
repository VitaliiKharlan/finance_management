import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/core/enums/category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categories_bloc/categories_bloc.dart';
import '../categories_bloc/categories_state.dart';
import '../expenses_bloc/expenses_bloc.dart';
import '../expenses_bloc/expenses_state.dart';
import '../repository/expenses_repository.dart';
import '../widgets/categories_balance_overview_section.dart';
import '../widgets/categories_expense_progress_bar_widget_section.dart';
import '../widgets/categories_header_section.dart';
import '../widgets/categories_main_section.dart';
import '../widgets/categories_selected_category_add_expenses.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  CategoriesBloc(firestore: FirebaseFirestore.instance),
        ),
        BlocProvider(
          create:
              (_) =>
                  ExpensesBloc(ExpensesRepository())
                    ..add(const LoadTotalExpenseEvent()),
        ),
      ],
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, categoriesState) {
          return BlocBuilder<ExpensesBloc, ExpensesState>(
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
                    const CategoriesSelectedCategoryAddExpenses(),
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
      ),
    );
  }
}
