import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categories_bloc/categories_bloc.dart';
import '../data/category_items.dart';
import '../widgets/categories_balance_overview_section.dart';
import '../widgets/categories_expenxe_progress_bar_widget_section.dart';
import '../widgets/categories_header_section.dart';
import '../widgets/categories_main_section.dart';

@RoutePage()
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(),
      child: Scaffold(
        backgroundColor: Color(0xFF00D09E),
        body: SafeArea(
          child: Column(
            children: [
              const CategoriesHeaderSection(),
              const CategoriesBalanceOverviewSection(
                totalBalance: 7783.00,
                totalExpense: 1187.40,
              ),
              const CategoriesExpenseProgressBarWidgetSection(
                percentage: 0.3,
                limitAmount: 20000.00,
              ),
              CategoriesMainSection(categories: categoryItems),
            ],
          ),
        ),
      ),
    );
  }
}
