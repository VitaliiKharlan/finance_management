import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class ProfileSecurityChangePinHeaderSection extends StatefulWidget {
  const ProfileSecurityChangePinHeaderSection({super.key});

  @override
  State<ProfileSecurityChangePinHeaderSection> createState() =>
      _ProfileSecurityChangePinHeaderSectionState();
}

class _ProfileSecurityChangePinHeaderSectionState
    extends State<ProfileSecurityChangePinHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              context.router.push(ProfileSecurityRoute());
            },
            child: SvgPicture.asset(AppIcons.iconNotificationBringBack),
          ),
          const Spacer(),
          Text(
            'Change Pin',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.lettersAndIcons,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              context.router.pushNamed('/main/notification');
            },
            child: SvgPicture.asset(
              AppIcons.iconHomeNotifications,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
