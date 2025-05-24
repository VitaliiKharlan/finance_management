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

  static const double _leadingWidth = 60; // ширина иконки + промежуток
  static const double _titleWidth =
      96; // фиксированная ширина колонки title+subtitle, подгони под свои данные
  static const double _dividerLeftMargin =
      8; // отступ от текста до левого делителяstatic const double _categoryWidth = 70; // фиксированная ширина категории
  static const double _categoryWidth = 60; // фиксированная ширина категории
  static const double _amountWidth = 72; // фиксированная ширина суммы

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _leadingWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: SvgPicture.asset(svgAsset, width: 57, height: 53),
            ),
          ),

          const SizedBox(width: 16),

          SizedBox(
            width: _titleWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Color(0xFF052224),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color(0xFF0068FF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: _dividerLeftMargin),

          Container(width: 1, height: 32, color: Colors.grey.shade400),

          const SizedBox(width: 6),

          SizedBox(
            width: _categoryWidth,
            child: Text(
              category,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(width: 6),

          Container(width: 1, height: 32, color: Colors.grey.shade400),

          const SizedBox(width: 8),

          SizedBox(
            width: _amountWidth,
            child: Text(
              amount,
              style: TextStyle(
                color: isExpense ? Colors.blue : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
