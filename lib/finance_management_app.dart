import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme_cubit/theme_cubit.dart';
import 'features/auth/auth_bloc/auth_bloc.dart';
import 'features/auth/auth_bloc/auth_state.dart';
import 'features/auth/auth_repository.dart';
import 'features/auth/auth_service.dart';
import 'features/category/categories_bloc/categories_bloc.dart';
import 'features/expense/expense_bloc/expense_bloc.dart';
import 'features/expense/repository/expense_repository.dart';

// class FinanceManagementApp extends StatefulWidget {
//   const FinanceManagementApp({super.key});
//
//   @override
//   State<FinanceManagementApp> createState() => _FinanceManagementAppState();
// }
//
// class _FinanceManagementAppState extends State<FinanceManagementApp> {
//   final _router = AppRouter();
//   final AuthService _authService = AuthService();
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider<AuthService>.value(value: _authService),
//         RepositoryProvider<AuthRepository>(
//           create:
//               (context) => AuthRepository(
//                 firestore: FirebaseFirestore.instance,
//                 authService: context.read<AuthService>(),
//               ),
//         ),
//       ],
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider<AuthBloc>(
//             create: (context) {
//               final bloc = AuthBloc(
//                 authRepository: context.read<AuthRepository>(),
//                 authService: _authService,
//               );
//               bloc.add(AuthStarted());
//               return bloc;
//             },
//           ),
//           BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
//           BlocProvider<CategoriesBloc>(
//             create:
//                 (context) =>
//                     CategoriesBloc(firestore: FirebaseFirestore.instance)
//                       ..add(LoadCategoriesEvent()),
//           ),
//           BlocProvider(
//             create:
//                 (context) =>
//             ExpenseBloc(
//               repository: ExpenseRepository(),
//             )
//               ..add(LoadExpensesEvent())..add(LoadTotalExpensesEvent()),
//           ),
//         ],
//         child: BlocBuilder<ThemeCubit, ThemeState>(
//           builder: (context, state) {
//             return MaterialApp.router(
//               localizationsDelegates: context.localizationDelegates,
//               supportedLocales: context.supportedLocales,
//               locale: context.locale,
//               debugShowCheckedModeBanner: false,
//               title: 'Finance Management',
//               theme: state.isLight ? lightTheme : darkTheme,
//               routerConfig: _router.config(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class FinanceManagementApp extends StatelessWidget {
  final _router = AppRouter();
  final _authService = AuthService();

  FinanceManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authService),
        RepositoryProvider(
          create:
              (context) => AuthRepository(
                firestore: FirebaseFirestore.instance,
                authService: _authService,
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  authService: _authService,
                )..add(AuthStarted()),
          ),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              _router.replaceAll([const MainRoute()]);
            } else if (state is Unauthenticated) {
              _router.replaceAll([const WelcomeRoute()]);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              if (authState is Authenticated) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create:
                          (_) =>
                              ExpenseBloc(
                                  repository: ExpenseRepository(
                                    userId: authState.user.id,
                                  ),
                                )
                                // ..add(UpdateUserEvent(userId: authState.user.id))
                                ..add(LoadExpensesEvent())
                                ..add(LoadTotalExpensesEvent()),
                    ),
                    BlocProvider(
                      create:
                          (_) => CategoriesBloc(
                            firestore: FirebaseFirestore.instance,
                            userId: authState.user.id,
                          )..add(LoadCategoriesEvent()),
                    ),
                  ],
                  child: BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      return MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        title: 'Finance Management',
                        theme: themeState.isLight ? lightTheme : darkTheme,
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        routerConfig: _router.config(),
                      );
                    },
                  ),
                );
              }

              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, themeState) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: 'Finance Management',
                    theme: themeState.isLight ? lightTheme : darkTheme,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    routerConfig: _router.config(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
