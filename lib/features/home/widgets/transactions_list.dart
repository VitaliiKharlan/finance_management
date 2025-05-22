import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TransactionTile(
          svgAsset: AppIcons.iconHomeSalary,
          title: "Salary",
          subtitle: "18:27 - April 30",
          category: "Monthly",
          amount: "\$4,000.00",
        ),
        TransactionTile(
          svgAsset: AppIcons.iconHomeGroceries,
          title: "Groceries",
          subtitle: "17:00 - April 24",
          category: "Pantry",
          amount: "-\$100.00",
          isExpense: true,
        ),
        TransactionTile(
          svgAsset: AppIcons.iconHomeRent,
          title: "Rent",
          subtitle: "8:30 - April 15",
          category: "Rent",
          amount: "-\$674.40",
          isExpense: true,
        ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String svgAsset;
  final String title;
  final String subtitle;
  final String category;
  final String amount;
  final bool isExpense;

  const TransactionTile({
    super.key,
    required this.svgAsset,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.amount,
    this.isExpense = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: SvgPicture.asset(svgAsset, width: 57, height: 53),
      ),

      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(category, style: TextStyle(color: Colors.grey)),
          Text(
            amount,
            style: TextStyle(
              color: isExpense ? Colors.blue : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
