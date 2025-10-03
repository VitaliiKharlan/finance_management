import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';

class ProfileSecurityMainSection extends StatelessWidget {
  const ProfileSecurityMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 32, 24, 8),
            child: Text(
              "Security",
              style: GoogleFonts.poppins(
                color: AppColors.backgroundDarkModeAndLetters,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 24),
          _ProfileSecurityTile(
            title: "Change Pin",
            onIconTap: () {
              final tabsRouter = AutoTabsRouter.of(context);
              tabsRouter.setActiveIndex(4);
            },
          ),
          SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(height: 2, thickness: 2),
          ),
          SizedBox(height: 12),
          _ProfileSecurityTile(
            title: "Fingerprint",
            onIconTap: () {
              final tabsRouter = AutoTabsRouter.of(context);
              tabsRouter.setActiveIndex(4);
            },
          ),
          SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Divider(height: 2, thickness: 2),
          ),
          SizedBox(height: 12),
          _ProfileSecurityTile(
            title: "Terms And Conditions",
            onIconTap: () {
              final tabsRouter = AutoTabsRouter.of(context);
              tabsRouter.setActiveIndex(4);
            },
          ),
        ],
      ),
    );
  }
}

class _ProfileSecurityTile extends StatelessWidget {
  const _ProfileSecurityTile({required this.title, required this.onIconTap});

  final String title;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: AppColors.lettersAndIcons,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: InkWell(
        onTap: onIconTap,
        child: SvgPicture.asset(AppIcons.iconProfileSecurityArrowForward),
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
