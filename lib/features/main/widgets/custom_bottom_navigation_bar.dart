import 'package:flutter/material.dart';

import '../../../core/constants/bottom_navigation_constants.dart';
import '../../../core/utils/bottom_navigation_item.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF7E2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(80),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          BottomNavigationConstants.items.length,
          (index) => BottomNavigationItem(
            assetPath: BottomNavigationConstants.items[index],
            isActive: currentIndex == index,
            onTap: () => onTap(index),
            theme: theme,
          ),
        ),
      ),
    );
  }
}