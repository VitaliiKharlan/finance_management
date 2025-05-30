import 'package:flutter/material.dart';

import '../../../core/theme/app_icons.dart';
import 'transaction_data.dart';
import 'transaction_transactions_header_with_calendar.dart';
import 'transaction_transactions_month.dart';

class TransactionTransactionsListSection extends StatelessWidget {
  const TransactionTransactionsListSection({super.key});

  static const List<TransactionData> aprilTransactions = [
    TransactionData(
      svgAsset: AppIcons.iconTransactionSalary,
      title: 'Salary',
      subtitle: "18:27 - April 30",
      category: "Monthly",
      amount: "\$4,000.00",
    ),
    TransactionData(
      svgAsset: AppIcons.iconTransactionGroceries,
      title: 'Groceries',
      subtitle: "17:00 - April 24",
      category: 'Pantry',
      amount: "-\$100.00",
      isExpense: true,
    ),
    TransactionData(
      svgAsset: AppIcons.iconTransactionRent,
      title: 'Rent',
      subtitle: "8:30 - March 15",
      category: "Rent",
      amount: "-\$674.40",
      isExpense: true,
    ),
    TransactionData(
      svgAsset: AppIcons.iconTransactionTransport,
      title: 'Transport',
      subtitle: "7:30 - March 08",
      category: "Fuel",
      amount: "-\$4.13",
      isExpense: true,
    ),
  ];

  static const List<TransactionData> marchTransactions = [
    TransactionData(
      svgAsset: AppIcons.iconTransactionFood,
      title: 'Food',
      subtitle: "8:30 - March 15",
      category: 'Dinner',
      amount: "-\$74.40",
      isExpense: true,
    ),
    TransactionData(
      svgAsset: AppIcons.iconTransactionTransport,
      title: 'Transport',
      subtitle: "7:30 - March 08",
      category: 'Fuel',
      amount: "-\$72.08",
      isExpense: true,
    ),
    TransactionData(
      svgAsset: AppIcons.iconTransactionGroceries,
      title: 'Groceries',
      subtitle: "7:30 - March 08",
      category: 'Fuel',
      amount: "-\$144.20",
      isExpense: true,
    ),
    TransactionData(
      svgAsset: AppIcons.iconTransactionFood,
      title: "Food",
      subtitle: "7:30 - March 08",
      category: 'Breakfast',
      amount: "-\$24.44",
      isExpense: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: const [
        TransactionTransactionsHeaderWithCalendar(monthName: 'April'),
        TransactionTransactionsMonth(
          month: 'April',
          transactions: aprilTransactions,
          showMonthLabel: false,
        ),
        TransactionTransactionsMonth(
          month: 'March',
          transactions: marchTransactions,
          showMonthLabel: true,
        ),
      ],
    );
  }
}
