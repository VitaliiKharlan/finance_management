import 'package:finance_management/features/title/title_screen.dart';

import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [AutoRoute(page: TitleRoute.page, path: '/')];
  }
}
