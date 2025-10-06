import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocProvider.value(
      value: authBloc,
      child: AutoTabsRouter(
        routes: [
          HomeRoute(),
          AnalysisRoute(),
          TransactionRoute(),
          CategoriesRoute(),
          ProfileRoute(),
          NotificationRoute(),
          AccountBalanceRoute(),
          QuicklyAnalysisRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            backgroundColor: const Color(0xFFF1FFF3),
            body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return FadeThroughTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  child: KeyedSubtree(
                    key: ValueKey(tabsRouter.activeIndex),
                    child: child,
                  ),
                );
              },
              child: child,
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => _openPage(index, tabsRouter),
            ),
          );
        },
      ),
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
