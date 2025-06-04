import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class SaveExpenseButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveExpenseButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        onPressed: onPressed,
        child: Text(
          'Save',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
