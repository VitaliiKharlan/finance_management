import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../../../core/router/router.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        AnalysisRoute(),
        TransactionsRoute(),
        CategoryRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          body: child,
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
