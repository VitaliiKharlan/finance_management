import 'package:flutter/material.dart';

import 'core/router/router.dart';


class FinanceManagementApp extends StatefulWidget {
  const FinanceManagementApp({super.key});

  @override
  State<FinanceManagementApp> createState() => _FinanceManagementAppState();
}

class _FinanceManagementAppState extends State<FinanceManagementApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finance Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}