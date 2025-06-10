import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_images.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../../auth/auth_bloc/auth_state.dart';
import '../profile_bloc/profile_bloc.dart';
import '../widgets/profile_header_section.dart';
import '../widgets/profile_main_section.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc()..add(ProfileViewEvent()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final fullName = state is Authenticated ? state.user.name : 'Guest';
          final displayId =
              state is Authenticated ? state.user.displayId : '00000000';

          return Scaffold(
            backgroundColor: const Color(0xFF00D09E),
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const ProfileHeaderSection(),
                      const SizedBox(height: 52),
                      ProfileMainSection(fullName: fullName, userId: displayId),
                    ],
                  ),
                  Positioned(
                    top: 72,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const CircleAvatar(
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
      ),
    );
  }
}
