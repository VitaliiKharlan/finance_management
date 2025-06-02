import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../categories_bloc/categories_bloc.dart';
import '../models/category_transaction_model.dart';
import '../utils/category_group_transactions_by_month.dart';
import 'categories_selected_category_header_with_calendar.dart';
import 'categories_selected_category_tile.dart';

class CategoriesSelectedCategory extends StatelessWidget {
  final List<CategoryTransactionModel> transactions;

  const CategoriesSelectedCategory({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final grouped = groupTransactionsByMonth(transactions);
    final groupedEntries = grouped.entries.toList();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: ListView(
            children: [
              CategoriesSelectedCategoryHeaderWithCalendar(
                monthName: groupedEntries.isNotEmpty
                    ? groupedEntries[0].key
                    : 'April',
                onCalendarPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDate != null && context.mounted) {
                    debugPrint('Selected date: $selectedDate');
                  }
                },
              ),

              if (transactions.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Text('No data for the selected category'),
                  ),
                )
              else
                ...groupedEntries.mapIndexed((index, entry) {
                  final month = entry.key;
                  final monthTransactions = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index != 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            month,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),

                      ...monthTransactions.map((transaction) {
                        final svgAsset = getCategoryIconPath(
                            transaction.category);
                        return CategoriesSelectedCategoryTile(
                          svgAsset: svgAsset,
                          title: transaction.title,
                          timeAndDate: transaction.timeAndDate,
                          amount: transaction.amount,
                          category: transaction.category,
                          isExpense: transaction.isExpense,
                        );
                      }),
                    ],
                  );
                }),
            ],
          ),
        ),

        Positioned(
          left: 80,
          right: 80,
          bottom: 8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainGreen,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(172, 36),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              // TODO: add action
              context.read<CategoriesBloc>().add(
                  AddExpenseButtonPressedEvent());
            },
            child: Text(
              'Add Expenses',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getCategoryIconPath(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return AppIcons.iconCategoriesFood;
      case 'transport':
        return AppIcons.iconCategoriesTransport;
      case 'medicine':
        return AppIcons.iconCategoriesMedicine;
      case 'groceries':
        return AppIcons.iconCategoriesGroceries;
      case 'rent':
        return AppIcons.iconCategoriesRent;
      case 'gifts':
        return AppIcons.iconCategoriesGifts;
      case 'savings':
        return AppIcons.iconCategoriesSavings;
      case 'entertainment':
        return AppIcons.iconCategoriesEntertainment;
      default:
        return AppIcons.iconCategoriesMore;
    }
  }
}
