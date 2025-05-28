import 'package:auto_route/auto_route.dart';
import 'package:finance_management/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_images.dart';
import '../../../core/widgets/show_confirmation_dialog.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../../auth/auth_bloc/auth_state.dart';
import '../widgets/profile_menu_item.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.router.replaceAll([WelcomeRoute()]);
        }
      },
      builder: (context, state) {
        final fullName = state is Authenticated ? state.user.name : 'Guest';
        final userId = state is Authenticated ? state.user.id : 'Unknown';
        return Scaffold(
          backgroundColor: const Color(0xFF00D09E),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
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
                    ),
                    SizedBox(height: 52),
                    Expanded(
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 52),
                                    Text(
                                      fullName,
                                      // 'Vitalii Kharlan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color(0xFF0E3E3E),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'ID: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Color(0xFF093030),
                                            ),
                                          ),
                                          TextSpan(
                                            text: userId,
                                            // text: '00000002',
                                            style: TextStyle(
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
                              ProfileMenuItem(
                                iconAsset: AppIcons.iconProfileEditProfile,
                                title: 'Edit Profile',
                                onTap: () {},
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
                                    message:
                                        'Are you sure you want to log out?',
                                    confirmText: 'Logout',
                                    cancelText: 'Cancel',
                                    onConfirmed: () {
                                      context.read<AuthBloc>().add(
                                        LogoutRequested(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 72,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(AppImages.userAvatar),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
