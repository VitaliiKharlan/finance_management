import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

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
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    dateController.text = _formatDate(selectedDate);
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMMM d, y').format(date);
  }

  @override
  void dispose() {
    dateController.dispose();
    amountController.dispose();
    titleController.dispose();
    messageController.dispose();
    super.dispose();
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

                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Date',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.lettersAndIcons,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                            dateController.text = _formatDate(date);
                          });
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.lightGreen,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 8),
                            Container(
                              width: 24,
                              height: 22,
                              decoration: BoxDecoration(
                                color: AppColors.mainGreen,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                AppIcons.iconTransactionCalendar,
                                width: 13,
                                height: 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 24,
                          minHeight: 22,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Category',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.lettersAndIcons,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 40,
                    child: DropdownButtonFormField<String>(
                      items: const [
                        DropdownMenuItem(value: 'Food', child: Text('Food')),
                        DropdownMenuItem(
                          value: 'Transport',
                          child: Text('Transport'),
                        ),
                        DropdownMenuItem(value: 'Rent', child: Text('Rent')),
                      ],
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Amount',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.lettersAndIcons,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '\$',
                        filled: true,
                        fillColor: AppColors.lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Expense Title',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.lettersAndIcons,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.lightGreen,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),


                  SizedBox(
                    height: 150,
                    child: TextField(
                      controller: messageController,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Enter Message',
                        hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.mainGreen,
                        ),
                        filled: true,
                        fillColor: AppColors.lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
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
                    // TODO: implement save logic
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
