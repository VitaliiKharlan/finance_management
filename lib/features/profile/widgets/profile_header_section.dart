import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_icons.dart';
import '../profile_bloc/profile_bloc.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          // SvgPicture.asset(AppIcons.iconProfileBringBack),
          //
          GestureDetector(
            child: SvgPicture.asset(AppIcons.iconProfileBringBack),
            onTap: () {
              context.read<ProfileBloc>().add(ProfileViewEvent());
            },
          ),
          //
          // IconButton(
          //   icon: SvgPicture.asset(
          //     AppIcons.iconProfileBringBack,
          //     width: 24,
          //     height: 24,
          //   ),
          //   onPressed: () {
          //     context.maybePop();
          //   },
          // ),
          const Spacer(),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileViewState) {
                return const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF093030),
                  ),
                );
              } else if (state is ProfileEditState) {
                return const Text(
                  'Edit My Profile',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF093030),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
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
