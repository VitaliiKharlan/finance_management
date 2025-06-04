import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class MessageField extends StatelessWidget {
  final TextEditingController controller;

  const MessageField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: SizedBox(
        height: 150,
        child: TextField(
          controller: controller,
          maxLines: 8,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.lettersAndIcons,
          ),
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
    );
  }
}
