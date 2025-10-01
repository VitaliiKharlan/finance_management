import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  User? get currentUser;

  Stream<User?> get authStateChanges;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  });

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> resetPassword({required String email});

  Future<void> updateUsername({required String username});

  Future<void> deleteAccount({required String email, required String password});

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  });
}
