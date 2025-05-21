import 'package:flutter/material.dart';

import '../../../core/theme/app_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 108,
      decoration: BoxDecoration(
        color: Color(0xFFDFF7E2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(80                                            ),
          topRight: Radius.circular(80),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(AppIcons.iconBottomNavigationBarHome, theme, 0),
          _buildNavItem(AppIcons.iconBottomNavigationBarAnalysis, theme, 1),
          _buildNavItem(AppIcons.iconBottomNavigationBarTransactions, theme, 2),
          _buildNavItem(AppIcons.iconBottomNavigationBarCategory, theme, 3),
          _buildNavItem(AppIcons.iconBottomNavigationBarProfile, theme, 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(String assetPath, ThemeData theme, int index) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isActive
                  ? theme.primaryColor.withValues(alpha: 0.1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          assetPath,
          width: 28,
          height: 28,
          color: isActive ? theme.primaryColor : Colors.grey,
        ),
      ),
    );
  }
}
