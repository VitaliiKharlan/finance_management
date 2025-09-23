import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';

class DateField extends StatelessWidget {
  final TextEditingController controller;
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const DateField({
    super.key,
    required this.controller,
    required this.initialDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            controller: controller,
            readOnly: true,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.lettersAndIcons,
            ),
            onTap: () async {
              // final date = await showDatePicker(
              //   context: context,
              //   initialDate: initialDate,
              //   firstDate: DateTime(2000),
              //   lastDate: DateTime.now(),
              // );
              final date = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: AppColors.mainGreen,
                        onPrimary: Colors.white,
                        onSurface: AppColors.lettersAndIcons,
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.mainGreen,
                        ),
                      ),
                      dialogTheme: DialogThemeData(
                        backgroundColor: AppColors.lightGreen,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (date != null) {
                onDateChanged(date);
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
      ],
    );
  }
}
