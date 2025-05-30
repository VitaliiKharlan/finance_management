import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionTransactionsTile extends StatelessWidget {
  final String svgAsset;
  final String title;
  final String subtitle;
  final String category;
  final String amount;
  final bool isExpense;

  const TransactionTransactionsTile({
    super.key,
    required this.svgAsset,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.amount,
    this.isExpense = false,
  });

  static const double _leadingWidth = 60;
  static const double _titleWidth = 96;
  static const double _dividerLeftMargin = 8;
  static const double _categoryWidth = 60;
  static const double _amountWidth = 72;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: _leadingWidth,
            child: Container(
              width: 57,
              height: 53,
              decoration: BoxDecoration(
                color:
                    isExpense
                        ? const Color(0xFF6DB6FE)
                        : const Color(0xFF0068FF),
                borderRadius: BorderRadius.circular(22),
              ),
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(svgAsset, fit: BoxFit.contain),
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
