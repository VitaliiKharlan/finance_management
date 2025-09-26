import 'package:auto_route/auto_route.dart';
import 'package:finance_management/features/quickly_analysis/widgets/quickly_analysis_main_section.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/quickly_analysis_header_section.dart';

@RoutePage()
class QuicklyAnalysisScreen extends StatelessWidget {
  const QuicklyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00D09E),
      body: SafeArea(
        child: Column(
          children: [
            const QuicklyAnalysisHeaderSection(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundGreenWhiteAndLetters,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),

                child: QuicklyAnalysisMainSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
