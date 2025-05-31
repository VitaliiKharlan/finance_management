import 'package:finance_management/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_icons.dart';
import '../models/category_transaction_model.dart';

class CategoriesSelectedCategory extends StatelessWidget {
  const CategoriesSelectedCategory({super.key, required this.transactions});

  final List<CategoryTransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: Column(
            children: [
              Expanded(
                child:
                    transactions.isEmpty
                        ? const Center(
                          child: Text('No data for the selected category'),
                        )
                        : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: transactions.length,
                                itemBuilder: (context, index) {
                                  final transaction = transactions[index];
                                  final svgAsset = getCategoryIconPath(
                                    transaction.category,
                                  );
                                  final isExpense = transaction.isExpense;

                                  return ListTile(
                                    leading: Container(
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
                                      child: SvgPicture.asset(
                                        svgAsset,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    title: Text(transaction.title),
                                    subtitle: Text(transaction.subtitle),
                                    trailing: Text(
                                      transaction.amount,
                                      style: TextStyle(
                                        color:
                                            isExpense
                                                ? Colors.red
                                                : Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
              ),
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
              minimumSize: Size(172, 36),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
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
