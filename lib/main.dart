import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/di/locator.dart';
import 'finance_management_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();

  setupLocator();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('uk', 'UA')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),

      child: const FinanceManagementApp(),
    ),
  );
}
