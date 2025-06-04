import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class CategoryField extends StatelessWidget {
  final String? selectedCategory;
  final ValueChanged<String?> onChanged;

  const CategoryField({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      '🍔 Food',
      '🚌 Transport',
      '🏠 Rent',
      '🛍️ Shopping',
      '🎮 Entertainment',
      '💊 Health',
      '💡 Utilities',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Category',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.lettersAndIcons,
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 40,
          child: Builder(
            builder: (context) {
              return GestureDetector(
                onTapDown: (details) async {
                  const menuWidth = 316.0;
                  final renderBox = context.findRenderObject() as RenderBox;
                  final overlay =
                      Overlay.of(context).context.findRenderObject()
                          as RenderBox;

                  final offset = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;
                  final screenSize = overlay.size;

                  final selected = await showMenu<String>(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      offset.dx,
                      offset.dy + size.height,
                      screenSize.width - offset.dx,
                      0,
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: menuWidth,
                      maxWidth: menuWidth,
                    ),
                    items:
                        categories
                            .map(
                              (cat) => PopupMenuItem<String>(
                                value: cat,
                                child: Text(
                                  cat,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.lettersAndIcons,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  );
                  if (selected != null) onChanged(selected);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCategory ?? 'Select the category',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color:
                              selectedCategory != null
                                  ? AppColors.lettersAndIcons
                                  : AppColors.mainGreen,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.mainGreen,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
