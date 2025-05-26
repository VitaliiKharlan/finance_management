import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme_cubit/theme_cubit.dart';

class FinanceManagementApp extends StatefulWidget {
  const FinanceManagementApp({super.key});

  @override
  State<FinanceManagementApp> createState() => _FinanceManagementAppState();
}

class _FinanceManagementAppState extends State<FinanceManagementApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
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
    );
  }
}
