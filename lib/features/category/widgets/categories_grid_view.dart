import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/enums/category_enum.dart';
import '../categories_bloc/categories_bloc.dart';
import '../categories_bloc/categories_state.dart';

class CategoriesGridView extends StatelessWidget {
  final List<CategoryEnum> categories;

  const CategoriesGridView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 30,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final category = categories[index];
        final iconPath = category.iconPath;
        final label = category.shortLabel;
        final blocState = context.watch<CategoriesBloc>().state;
        final isSelected =
            blocState is CategoriesLoadedState &&
            blocState.selectedIndex == index;

        return GestureDetector(
          onTap: () {
            context.read<CategoriesBloc>().add(
              CategorySelectedEvent(category, index),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 105,
                height: 98,
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color(0xFF0068FF)
                          : const Color(0xFF6DB6FE),
                  borderRadius: BorderRadius.circular(25.75),
                ),
                padding: const EdgeInsets.all(24),
                child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF093030),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
