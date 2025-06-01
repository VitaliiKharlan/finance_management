import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class CategoriesSelectedCategoryHeaderWithCalendar extends StatelessWidget {
  final String monthName;
  final VoidCallback? onCalendarPressed;

  const CategoriesSelectedCategoryHeaderWithCalendar({
    super.key,
    required this.monthName,
    this.onCalendarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            monthName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          GestureDetector(
            onTap:
                onCalendarPressed ??
                () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDate != null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected Date: $selectedDate')),
                    );
                  }
                },
            child: Container(
              width: 32,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.mainGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AppIcons.iconTransactionCalendar,
                width: 18,
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
