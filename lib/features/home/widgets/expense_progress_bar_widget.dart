import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    final barHeight = 32.0;
    final displayPercentage = (progress * 100).toStringAsFixed(0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: barHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Container(
                height: barHeight,
                width: MediaQuery.sizeOf(context).width * progress - 32,
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
          SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(AppIcons.iconHomeCheck, height: 11, width: 11),
              const SizedBox(width: 8),
              Text(
                '$displayPercentage% Of Your Expenses, Looks Good.',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
