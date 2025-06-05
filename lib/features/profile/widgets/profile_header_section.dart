import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_icons.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.iconProfileBringBack),
          const Spacer(),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF093030),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppIcons.iconHomeNotifications,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
