import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/features/auth/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/logger/i_logger_service.dart';
import '../../core/constants/firestore_constants.dart';
import 'customer.dart';
import 'user_registration_dto.dart';

abstract class IAuthRepository<T> {
  Future<T> getUser(String uid);

  Future<void> registerCustomer({
    required UserEntity user,
    required Customer customer,
    required String password,
  });
}

class AuthRepository implements IAuthRepository<UserEntity> {
  AuthRepository({
    required FirebaseFirestore firestore,
    FirebaseAuth? firebaseAuth,
  }) : _firestore = firestore,
       _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e, s) {
      logger.log(
        'Login failed: ${e.message}',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.warning,
      );
      throw Exception('Login error: ${e.message}');
    } catch (e, s) {
      logger.log(
        'Unexpected error during login',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }

  @override
  Future<UserEntity> getUser(String uid) async {
    try {
      final response =
          await _firestore
              .collection(FirestoreCollections.users)
              .doc(uid)
              .get();

      final data = response.data();
      if (response.exists && data != null) {
        return UserEntity.fromJson(data);
      } else {
        throw Exception('User not found');
      }
    } catch (e, s) {
      logger.log(
        'Error getting user',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }

  Future<User> registerFirebaseUser(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!;
    } on FirebaseAuthException catch (e, s) {
      logger.log(
        'Firebase Registration Error: ${e.message}',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.warning,
      );
      throw Exception('Registration error: ${e.message}');
    } catch (e, s) {
      logger.log(
        'Unknown error while registering Firebase',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }

  Future<void> _saveUserDataToFirestore(UserEntity user) async {
    try {
      await _firestore
          .collection(FirestoreCollections.users)
          .doc(user.id)
          .set(user.toJson());
    } catch (e, s) {
      logger.log(
        'Error saving user data',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      throw Exception('Error saving user');
    }
  }

  @override
  Future<void> registerCustomer({
    required UserEntity user,
    required Customer customer,
    required String password,
  }) async {
    try {
      final firebaseUser = await registerFirebaseUser(user.email, password);

      final newUser = UserEntity(
        id: firebaseUser.uid,
        name: user.name,
        email: user.email,
        mobileNumber: user.mobileNumber,
        dateOfBirth: user.dateOfBirth,
      );

      await _saveUserDataToFirestore(newUser);

      final profile = UserRegistrationDto(
        id: firebaseUser.uid,
        name: customer.name!,
        email: customer.email!,
      );

      await _firestore
          .collection(FirestoreCollections.userProfiles)
          .doc(profile.id)
          .set(profile.toJson());
    } catch (e, s) {
      logger.log(
        'Error while registering client',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }
}
