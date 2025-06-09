import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/enums/category_enum.dart';
import '../../../core/theme/app_colors.dart';
import '../categories_bloc/categories_bloc.dart';
import '../expenses_bloc/expenses_bloc.dart';
import 'add_expenses.fields/amount_field.dart';
import 'add_expenses.fields/category_field.dart';
import 'add_expenses.fields/date_field.dart';
import 'add_expenses.fields/expense_title_field.dart';
import 'add_expenses.fields/message_field.dart';
import 'add_expenses.fields/save_expenses_button.dart';

class CategoriesSelectedCategoryAddExpenses extends StatefulWidget {
  const CategoriesSelectedCategoryAddExpenses({super.key});

  @override
  State<CategoriesSelectedCategoryAddExpenses> createState() =>
      _CategoriesSelectedCategoryAddExpensesState();
}

class _CategoriesSelectedCategoryAddExpensesState
    extends State<CategoriesSelectedCategoryAddExpenses> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  CategoryEnum? selectedCategory;

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('MMMM d, y').format(selectedDate);
  }

  @override
  void dispose() {
    dateController.dispose();
    amountController.dispose();
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _onSavePressed() {
    if (selectedCategory == null ||
        amountController.text.isEmpty ||
        titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    context.read<ExpensesBloc>().add(
      SaveExpenseEvent(
        category: selectedCategory!.label,
        date: selectedDate,
        amount: double.tryParse(amountController.text) ?? 0,
        title: titleController.text,
        message: messageController.text,
      ),
    );

    context.read<CategoriesBloc>().add(CategoryBackEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundGreenWhiteAndLetters,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 48,
          top: 24,
          right: 48,
          bottom: 12,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateField(
                    controller: dateController,
                    initialDate: selectedDate,
                    onDateChanged: (date) {
                      setState(() {
                        selectedDate = date;
                        dateController.text = DateFormat(
                          'MMMM d, y',
                        ).format(date);
                      });
                    },
                  ),
                  CategoryField(
                    selectedCategory: selectedCategory,
                    onChanged: (value) {
                      setState(() => selectedCategory = value);
                    },
                  ),
                  AmountField(controller: amountController),
                  ExpenseTitleField(controller: titleController),
                  MessageField(controller: messageController),
                ],
              ),
              SaveExpenseButton(onPressed: _onSavePressed),
            ],
          ),
        ),
      ),
    );
  }
}
