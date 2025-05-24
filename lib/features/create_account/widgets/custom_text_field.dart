import 'package:finance_management/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_icons.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final VoidCallback? toggleVisibility;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.toggleVisibility,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(label, style: AppTextStyles.description),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.bodyLarge,
              filled: true,
              fillColor: Colors.green.shade50,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 12,
              ),
              suffixIcon:
                  toggleVisibility != null
                      ? IconButton(
                    icon: SvgPicture.asset(
                          obscureText
                              ? AppIcons.iconCreateAccountScreenEyePassClosed
                              : AppIcons.iconCreateAccountScreenEyePassOpen,
                          width: 24,
                          height: 9,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: toggleVisibility,
                      )
                      : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
            controller: controller,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
