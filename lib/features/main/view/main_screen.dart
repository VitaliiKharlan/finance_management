import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/router.dart';
import '../../auth/auth_bloc/auth_bloc.dart';
import '../../auth/auth_repository.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create:
          (context) => AuthBloc(
            authRepository: AuthRepository(
              firestore: FirebaseFirestore.instance,
            ),
          ),
      child: AutoTabsRouter(
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
            backgroundColor: const Color(0xFFF1FFF3),
            body: child,
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
