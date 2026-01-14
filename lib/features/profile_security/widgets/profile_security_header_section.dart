import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/router/router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class ProfileSecurityHeaderSection extends StatefulWidget {
  const ProfileSecurityHeaderSection({super.key});

  @override
  State<ProfileSecurityHeaderSection> createState() =>
      _ProfileSecurityHeaderSectionState();
}

class _ProfileSecurityHeaderSectionState
    extends State<ProfileSecurityHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              final tabsRouter = AutoTabsRouter.of(context);
              tabsRouter.setActiveIndex(4);
            },
            child: SvgPicture.asset(AppIcons.iconNotificationBringBack),
          ),
          const Spacer(),
          Text(
            'Security',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.lettersAndIcons,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              context.pushRoute(const NotificationRoute());
              // final tabsRouter = AutoTabsRouter.of(context);
              // tabsRouter.setActiveIndex(5);
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
