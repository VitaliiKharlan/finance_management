import 'package:finance_management/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../auth/auth_bloc/auth_bloc.dart';

class AnalysisHeaderSection extends StatefulWidget {
  const AnalysisHeaderSection({super.key});

  @override
  State<AnalysisHeaderSection> createState() => _AnalysisHeaderSectionState();
}

class _AnalysisHeaderSectionState extends State<AnalysisHeaderSection> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.iconTransactionBringBack),
          const Spacer(),
          Text(
            'Analysis',
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
