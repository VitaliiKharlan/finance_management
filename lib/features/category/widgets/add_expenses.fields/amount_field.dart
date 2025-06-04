import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;

  const AmountField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 24),
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
            controller: controller,
            keyboardType: TextInputType.number,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.lettersAndIcons,
            ),
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
      ],
    );
  }
}
