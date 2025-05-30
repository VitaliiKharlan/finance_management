import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../auth/auth_bloc/auth_bloc.dart';

class TransactionsHeaderSection extends StatefulWidget {
  const TransactionsHeaderSection({super.key});

  @override
  State<TransactionsHeaderSection> createState() =>
      _TransactionsHeaderSectionState();
}

class _TransactionsHeaderSectionState extends State<TransactionsHeaderSection> {
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
            'Transaction',
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
