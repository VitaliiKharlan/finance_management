import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/features/auth/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/logger/i_logger_service.dart';
import '../../core/constants/firestore_constants.dart';
import 'customer.dart';
import 'i_auth_repository.dart';
import 'user_registration_dto.dart';

class AuthRepository implements IAuthRepository<UserEntity> {
  AuthRepository({
    required FirebaseFirestore firestore,
    FirebaseAuth? firebaseAuth,
  }) : _firestore = firestore,
       _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  Future<void> login(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
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
        return UserEntity.fromMap(data);
      } else {
        throw Exception('No user data found');
      }
    } catch (e, s) {
      logger.log(
        'Error getting user data',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }

  Future<User> registerFirebaseUser(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  Future<void> _saveUserData(UserEntity user) async {
    await _firestore
        .collection(FirestoreCollections.users)
        .doc(user.id)
        .set(user.toMap());
  }

  @override
  Future<void> registerCustomer({
    required UserEntity user,
    required Customer customer,
    required String password, // Пароль отдельно
  }) async {
    try {
      // 1. Создаём пользователя в Firebase Authentication
      final firebaseUser = await registerFirebaseUser(user.email, password);

      // 2. Создаём нового UserEntity с uid из Firebase (без пароля!)
      final newUser = UserEntity(
        id: firebaseUser.uid,
        name: user.name,
        email: user.email,
        mobileNumber: user.mobileNumber,
        dateOfBirth: user.dateOfBirth,
      );

      // 3. Сохраняем пользователя в Firestore
      await _saveUserData(newUser);

      // 4. Сохраняем профиль клиента, id профиля равен uid пользователя

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
        'Registration failed',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }
}
