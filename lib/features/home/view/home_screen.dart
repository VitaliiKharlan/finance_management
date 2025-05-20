import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../../../core/theme/app_icons.dart';
import '../widgets/balance_summary_widget.dart';
import '../widgets/balance_widget.dart';
import '../widgets/daily_weekly_monthly.dart';
import '../widgets/expense_progress_bar_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color(0xFF00D09E),
      appBar: AppBar(
        backgroundColor: Color(0xFF00D09E),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Welcome Back',
                    style: theme.appBarTheme.titleTextStyle,
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Good Morning',
                    style: theme.appBarTheme.titleTextStyle?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ],
              ),
              // SizedBox(width: 40),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDFF7E2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppIcons.iconAppBarNotificationsBell,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: kToolbarHeight,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BalanceSummaryWidget(
                  totalBalance: 7783.00,
                  totalExpense: 1187.40,
                ),
                SizedBox(height: 8),
                ExpenseProgressBarWidget(
                  percentage: 0.3,
                  limitAmount: 20000.00,
                ),
                const SizedBox(height: 8),
                const Text(
                  '30% Of Your Expenses, Looks Good.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                // const BalanceWidget(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 160,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    const BalanceWidget(),
                    SizedBox(height: 8),
                    const DailyWeeklyMonthlyWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
