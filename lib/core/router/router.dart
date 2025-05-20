import 'package:finance_management/features/main/view/main_screen.dart';

import 'package:auto_route/auto_route.dart';

import '../../features/analysis/view/analysis.dart';
import '../../features/category/view/category_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/transactions/view/transactions_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: MainRoute.page,
        path: '/',
        children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: AnalysisRoute.page, path: 'analysis'),
        AutoRoute(page: TransactionsRoute.page, path: 'transactions'),
        AutoRoute(page: CategoryRoute.page, path: 'category'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),

        ],
      ),
    ];
  }
}
