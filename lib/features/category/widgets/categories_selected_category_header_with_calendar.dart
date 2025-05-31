import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class CategoriesSelectedCategoryHeaderWithCalendar extends StatelessWidget {
  final String monthName;

  const CategoriesSelectedCategoryHeaderWithCalendar({
    super.key,
    required this.monthName,
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
            onTap: () {
              // TODO: implement calendar
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
