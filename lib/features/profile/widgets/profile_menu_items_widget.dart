import 'package:finance_management/features/profile/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_icons.dart';
import '../../../core/widgets/show_confirmation_dialog.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../profile_bloc/profile_bloc.dart';

class ProfileMenuItemsWidget extends StatelessWidget {
  const ProfileMenuItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenuItem(
          iconAsset: AppIcons.iconProfileEditProfile,
          title: 'Edit Profile',
          onTap: () {
            context.read<ProfileBloc>().add(EditProfileEvent());
          },
        ),
        ProfileMenuItem(
          iconAsset: AppIcons.iconProfileSecurity,
          title: 'Security',
          onTap: () {},
        ),
        ProfileMenuItem(
          iconAsset: AppIcons.iconProfileSettings,
          title: 'Setting',
          onTap: () {},
        ),
        ProfileMenuItem(
          iconAsset: AppIcons.iconProfileHelp,
          title: 'Help',
          onTap: () {},
        ),
        ProfileMenuItem(
          iconAsset: AppIcons.iconProfileLogout,
          title: 'Logout',
          onTap: () {
            showConfirmationDialog(
              context: context,
              title: 'Confirm Logout',
              message: 'Are you sure you want to log out?',
              confirmText: 'Logout',
              cancelText: 'Cancel',
              onConfirmed: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
            );
          },
        ),
      ],
    );
  }
}
