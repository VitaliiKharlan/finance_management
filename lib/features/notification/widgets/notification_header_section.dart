import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class NotificationHeaderSection extends StatefulWidget {
  const NotificationHeaderSection({super.key});

  @override
  State<NotificationHeaderSection> createState() =>
      _NotificationHeaderSectionState();
}

class _NotificationHeaderSectionState extends State<NotificationHeaderSection> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              context.maybePop();
            },
            child: SvgPicture.asset(AppIcons.iconNotificationBringBack),
          ),
          const Spacer(),
          Text(
            'Notification',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.lettersAndIcons,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppIcons.iconTransactionNotifications,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
