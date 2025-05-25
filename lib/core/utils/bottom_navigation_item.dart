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
        width: 57,
        height: 53,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF00D09E) : Colors.transparent,
          borderRadius: BorderRadius.circular(22),
        ),
        child: SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            isActive ? Color(0xFF052224) : Color(0xFF052224),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
