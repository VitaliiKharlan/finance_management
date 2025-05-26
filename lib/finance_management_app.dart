import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme_cubit/theme_cubit.dart';
import 'features/auth/auth_bloc/auth_bloc.dart';
import 'features/auth/auth_repository.dart';
import 'features/auth/auth_service.dart';

class FinanceManagementApp extends StatefulWidget {
  const FinanceManagementApp({super.key});

  @override
  State<FinanceManagementApp> createState() => _FinanceManagementAppState();
}

class _FinanceManagementAppState extends State<FinanceManagementApp> {
  final _router = AppRouter();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>.value(value: _authService),
        RepositoryProvider<AuthRepository>(
          create: (context) =>
              AuthRepository(
                firestore: FirebaseFirestore.instance,
                authService: context.read<AuthService>(),
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) {
              final bloc = AuthBloc(
                authRepository: context.read<AuthRepository>(),
                authService: _authService,
              );
              bloc.add(AuthStarted());
              return bloc;
            },
          ),
          BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'Finance Management',
              theme: state.isLight ? lightTheme : darkTheme,
              routerConfig: _router.config(),
            );
          },
        ),
      ),
    );
  }
}