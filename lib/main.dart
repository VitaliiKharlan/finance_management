import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/auth_bloc/auth_bloc.dart';
import 'features/auth/auth_repository.dart';
import 'finance_management_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepository(firestore: FirebaseFirestore.instance),
        ),
        BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(
                authRepository: context.read<AuthRepository>(),
              ),
        ),
      ],
      child: const FinanceManagementApp(),
    ),
  );
}
