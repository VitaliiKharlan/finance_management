import 'package:auto_route/auto_route.dart';
import 'package:finance_management/features/main/view/main_screen.dart';

import '../../features/account_balance/view/account_balance_screen.dart';
import '../../features/analysis/view/analysis_screen.dart';
import '../../features/auth/views/create_account/view/create_account_screen.dart';
import '../../features/auth/views/welcome/view/welcome_screen.dart';
import '../../features/category/view/categories_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/notification/view/notification_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/profile_security/view/profile_security_change_pin_screen.dart';
import '../../features/profile_security/view/profile_security_fingerprint_screen.dart';
import '../../features/profile_security/view/profile_security_screen.dart';
import '../../features/profile_security/view/profile_security_terms_and_conditions.dart';
import '../../features/quickly_analysis/view/quickly_analysis_screen.dart';
import '../../features/transaction/view/transaction_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: WelcomeRoute.page, path: '/', initial: true),
      AutoRoute(page: CreateAccountRoute.page, path: '/create_account'),
      AutoRoute(
        page: MainRoute.page,
        path: '/main',
        children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: AnalysisRoute.page, path: 'analysis'),
          AutoRoute(page: TransactionRoute.page, path: 'transaction'),
          AutoRoute(page: CategoriesRoute.page, path: 'categories'),
          AutoRoute(
            page: ProfileWrapperRoute.page,
            path: 'profile_wrapper',
            children: [
              AutoRoute(
                page: ProfileRoute.page,
                path: 'profile',
                initial: true,
              ),
              AutoRoute(
                page: ProfileSecurityRoute.page,
                path: 'profile_security',
              ),
              AutoRoute(
                page: ProfileSecurityChangePinRoute.page,
                path: 'change_pin',
              ),
              AutoRoute(
                page: ProfileSecurityFingerprintRoute.page,
                path: 'fingerprint',
              ),
              AutoRoute(
                page: ProfileSecurityTermsAndConditionsRoute.page,
                path: 'terms_and_conditions',
              ),
            ],
          ),
          AutoRoute(page: NotificationRoute.page, path: 'notification'),
          AutoRoute(page: AccountBalanceRoute.page, path: 'account_balance'),
          AutoRoute(page: QuicklyAnalysisRoute.page, path: 'quickly_analysis'),
        ],
      ),
    ];
  }
}
