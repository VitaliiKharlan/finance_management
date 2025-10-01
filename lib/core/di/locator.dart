import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/repository/auth_repository.dart';
import '../../features/auth/repository/i_auth_repository.dart';
import '../../features/auth/services/auth_service.dart';
import '../../features/auth/services/i_auth_service.dart';
import '../../features/expense/repository/expense_repository.dart';
import '../../features/expense/repository/i_expense_repository.dart';
import '../logger/i_logger_service.dart';
import '../logger/logger_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  /// Logger
  getIt.registerLazySingleton<ILoggerService>(() => LoggerService());

  /// Service
  getIt.registerLazySingleton<IAuthService>(() => AuthService());

  /// Repositories
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      firestore: FirebaseFirestore.instance,
      authService: getIt<IAuthService>(),
    ),
  );

  getIt.registerLazySingleton<IExpenseRepository>(
    () => ExpenseRepository(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ),
  );
}
