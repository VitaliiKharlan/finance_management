import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/category_enum.dart';
import '../../../core/theme/app_colors.dart';
import '../categories_bloc/categories_bloc.dart';
import '../categories_bloc/categories_state.dart';
import 'categories_grid_view.dart';
import 'categories_selected_category.dart';

class CategoriesMainSection extends StatelessWidget {
  const CategoriesMainSection({super.key, required this.categories});

  final List<CategoryEnum> categories;

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
          left: 32,
          top: 32,
          right: 32,
          bottom: 12,
        ),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesInitialState) {
              return CategoriesGridView(categories: categories);
            } else if (state is CategoriesLoadedState) {
              return CategoriesSelectedCategory(
                transactions: state.filteredTransactions,
              );
            } else if (state is CategoriesFailureState) {
              return Center(
                child: Text(
                  'Unknown Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
