import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_icons.dart';
import '../../expense/expense_bloc/expense_bloc.dart';
import '../../expense/expense_bloc/expense_state.dart';

class QuicklyAnalysisBalanceCardSection extends StatelessWidget {
  const QuicklyAnalysisBalanceCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        final revenueLastWeek = state.when(
          initial: (totalExpense) => totalExpense,
          loading: (totalExpense, _) => totalExpense,
          loaded:
              (totalExpense, totalFoodLastWeekExpense, _, __) => totalExpense,
          failure: (_, totalExpense) => totalExpense,
        );

        final foodLastWeek = state.when(
          initial: (totalExpense) => 0.0,
          loading: (totalExpense, _) => 0.0,
          loaded:
              (totalExpense, totalFoodLastWeekExpense, _, __) =>
                  totalFoodLastWeekExpense,
          failure: (_, totalExpense) => 0.0,
        );

        return Container(
          constraints: BoxConstraints(maxWidth: 332),
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF00D09E),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(height: 8),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 68,
                        height: 68,
                        child: CircularProgressIndicator(
                          value: 0.50,
                          backgroundColor: Colors.white24,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                          ),
                          strokeWidth: 4,
                        ),
                      ),

                      SvgPicture.asset(
                        AppIcons.iconHomeSavingCar,
                        width: 38,
                        height: 22,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Savings\nOn Goals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 32),

              Container(width: 1, height: 100, color: Colors.white),

              const SizedBox(width: 20),

              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.iconHomeSavingSalary,
                          width: 31,
                          height: 28,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Revenue Last Week',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '\$${revenueLastWeek.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(width: 150, height: 1, color: Colors.white),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.iconHomeSavingFood,
                          width: 20,
                          height: 34,
                        ),
                        SizedBox(width: 18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food Last Week',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '-\$${foodLastWeek.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
