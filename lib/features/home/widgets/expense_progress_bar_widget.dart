import 'package:flutter/material.dart';

class ExpenseProgressBarWidget extends StatelessWidget {
  final double percentage;
  final double limitAmount;

  const ExpenseProgressBarWidget({
    super.key,
    required this.percentage,
    required this.limitAmount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = percentage.clamp(0.0, 1.0);
    final barHeight = 20.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: barHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              height: barHeight,
              width: MediaQuery.of(context).size.width * progress - 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${limitAmount.toStringAsFixed(2)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}