import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('User not found');
        case 'wrong-password':
          throw Exception('Incorrect password');
        case 'invalid-email':
          throw Exception('Incorrect email');
        case 'user-disabled':
          throw Exception('User blocked');
        default:
          throw Exception(e.message ?? 'Login error');
      }
    }
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('This email is already in use');
        case 'invalid-email':
          throw Exception('Incorrect email');
        case 'weak-password':
          throw Exception('The password is too simple');
        default:
          throw Exception(e.message ?? 'Registration error');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Error logging out of account');
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw Exception('Incorrect email');
      } else if (e.code == 'user-not-found') {
        throw Exception('User not found');
      } else {
        throw Exception(e.message ?? 'Password reset error');
      }
    }
  }

  Future<void> updateUsername({required String username}) async {
    try {
      await currentUser!.updateDisplayName(username);
    } catch (e) {
      throw Exception('Error updating username');
    }
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await currentUser!.reauthenticateWithCredential(credential);
      await currentUser!.delete();
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          throw Exception('Incorrect password');
        case 'user-mismatch':
          throw Exception('Email does not match current user');
        case 'requires-recent-login':
          throw Exception('Re-authentication required');
        default:
          throw Exception(e.message ?? 'Error deleting account');
      }
    }
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );
      await currentUser!.reauthenticateWithCredential(credential);
      await currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        throw Exception('Incorrect current password');
      } else if (e.code == 'user-mismatch') {
        throw Exception('Email does not match current user');
      } else if (e.code == 'invalid-credential') {
        throw Exception('Incorrect authentication data');
      } else {
        throw Exception(e.message ?? 'Authentication error');
      }
    }
  }
}
