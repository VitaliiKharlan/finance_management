import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final String assetPath;
  final bool isActive;
  final VoidCallback onTap;
  final ThemeData theme;

  const BottomNavigationItem({
    super.key,
    required this.assetPath,
    required this.isActive,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isActive
                  ? theme.primaryColor.withOpacity(0.1)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          assetPath,
          width: 28,
          height: 28,
          colorFilter: ColorFilter.mode(
            isActive ? theme.primaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
