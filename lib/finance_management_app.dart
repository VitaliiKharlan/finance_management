import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme_cubit/theme_cubit.dart';
import 'core/theme_cubit/theme_state.dart';
import 'features/auth/auth_bloc/auth_bloc.dart';
import 'features/auth/auth_bloc/auth_state.dart';
import 'features/auth/repository/auth_repository.dart';
import 'features/auth/services/auth_service.dart';
import 'features/category/categories_bloc/categories_bloc.dart';
import 'features/expense/expense_bloc/expense_bloc.dart';
import 'features/expense/repository/expense_repository.dart';

class FinanceManagementApp extends StatelessWidget {
  final _router = AppRouter();
  final _authService = AuthService();

  FinanceManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authService),
        RepositoryProvider(
          create:
              (context) =>
              AuthRepository(
                firestore: firestore,
                authService: _authService,
              ),
        ),
        RepositoryProvider(
          create: (context) =>
              ExpenseRepository(
                firestore: firestore,
                auth: auth,
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
            AuthBloc(
              authRepository: context.read<AuthRepository>(),
              authService: _authService,
            )
              ..add(AuthStarted()),
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
                          firestore: firestore,
                          auth: auth,
                        ),
                      )
                        ..add(LoadExpensesEvent())..add(
                          LoadTotalExpensesEvent()),
                    ),
                    BlocProvider(
                      create:
                          (_) =>
                      CategoriesBloc(
                        expenseRepository:
                        context.read<ExpenseRepository>(),
                      )
                        ..add(LoadCategoriesEvent()),
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
