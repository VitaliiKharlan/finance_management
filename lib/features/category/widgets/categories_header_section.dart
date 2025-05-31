import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../auth/auth_bloc/auth_bloc.dart';
import '../categories_bloc/categories_bloc.dart';
import '../categories_bloc/categories_state.dart';

class CategoriesHeaderSection extends StatefulWidget {
  const CategoriesHeaderSection({super.key});

  @override
  State<CategoriesHeaderSection> createState() =>
      _CategoriesHeaderSectionState();
}

class _CategoriesHeaderSectionState extends State<CategoriesHeaderSection> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              context.read<CategoriesBloc>().add(CategoryBackEvent());
            },
            child: SvgPicture.asset(AppIcons.iconCategoriesBringBack),
          ),
          const Spacer(),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              String title = 'Categories';

              if (state is CategoriesLoadedState) {
                title = state.selectedCategory;
              }
              return Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF093030),
                ),
              );
            },
          ),
          const Spacer(),
          SvgPicture.asset(
            AppIcons.iconCategoriesNotifications,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
