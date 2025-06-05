import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_icons.dart';
import '../../../core/widgets/show_confirmation_dialog.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../profile_bloc/profile_bloc.dart';
import '../widgets/profile_menu_item.dart';

class ProfileMainSection extends StatelessWidget {
  final String fullName;
  final String userId;

  const ProfileMainSection({
    super.key,
    required this.fullName,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF1FFF3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 52),
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF0E3E3E),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'ID: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF093030),
                            ),
                          ),
                          TextSpan(
                            text: userId,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Color(0xFF093030),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileEditState) {
                    return ProfileMenuItem(
                      iconAsset: AppIcons.iconProfileEditProfile,
                      title: 'Edit Profile',
                      onTap: () {
                        context.read<ProfileBloc>().add(EditProfileEvent());
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
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
          ),
        ),
      ),
    );
  }
}
