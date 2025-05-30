import 'package:easy_localization/easy_localization.dart';
import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../auth/auth_bloc/auth_bloc.dart';
import '../../auth/auth_bloc/auth_state.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthStarted());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                debugPrint('initial');
              }
              if (state is AuthLoading) {
                debugPrint('loading');
              }
              if (state is AuthSuccess) {
                debugPrint('success');
              }
              if (state is Authenticated) {
                final userName = state.user.name;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: '${'hiWelcomeBack'.tr()}, '),
                          TextSpan(
                            text: userName,
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'goodMorning'.tr(),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          const Spacer(),
          SvgPicture.asset(
            AppIcons.iconHomeNotifications,
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}
