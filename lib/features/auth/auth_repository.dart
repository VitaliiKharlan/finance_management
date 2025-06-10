import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/features/auth/user_entity.dart';

import '../../../../core/logger/i_logger_service.dart';
import '../../core/constants/firestore_constants.dart';
import 'auth_service.dart';
import 'user_registration_dto.dart';

abstract class IAuthRepository<T> {
  Future<UserEntity> getUser(String uid);

  Future<void> registerCustomer({
    required UserEntity user,

    required String password,
  });
}

class AuthRepository implements IAuthRepository<UserEntity> {
  AuthRepository({
    required FirebaseFirestore firestore,
    required AuthService authService,
  }) : _firestore = firestore,
        _authService = authService;

  final FirebaseFirestore _firestore;
  final AuthService _authService;

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

  @override
  Future<void> registerCustomer({
    required UserEntity user,

    required String password,
  }) async {
    try {
      final userCredential = await _authService.createAccount(
        email: user.email,
        password: password,
      );

      final firebaseUser = userCredential.user!;
      final displayId = await _generateUniqueDisplayId();

      final newUser = UserEntity(
        id: firebaseUser.uid,
        name: user.name,
        email: user.email,
        mobileNumber: user.mobileNumber,
        dateOfBirth: user.dateOfBirth,
        displayId: displayId,
      );

      await _firestore
          .collection(FirestoreCollections.users)
          .doc(newUser.id)
          .set(newUser.toJson());

      final profile = UserRegistrationDto(
        id: firebaseUser.uid,
        name: user.name,
        email: user.email,
        displayId: displayId,
      );

      await _firestore
          .collection(FirestoreCollections.userProfiles)
          .doc(profile.id)
          .set(profile.toJson());
    } catch (e, s) {
      logger.log(
        'Error while registering customer',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }

  Future<String> _generateUniqueDisplayId() async {
    final random = Random();

    while (true) {
      final id = (10000000 + random.nextInt(90000000)).toString();

      final querySnapshot =
          await _firestore
              .collection(FirestoreCollections.users)
              .where('displayId', isEqualTo: id)
              .limit(1)
              .get();

      if (querySnapshot.docs.isEmpty) {
        return id;
      }
    }
  }
}
