import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/features/auth/user_entity.dart';

import '../../../../core/logger/i_logger_service.dart';
import '../../core/constants/firestore_constants.dart';
import 'customer.dart';
import 'customer_profile_dto.dart';

abstract class IAuthRepository<T> {
  Future<T> getUser(String uid);

  Future<void> registerCustomer({
    required UserEntity user,
    required Customer customer,
  });
}

class AuthRepository implements IAuthRepository<dynamic> {
  AuthRepository({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

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
        throw Exception('No data');
      }
    } catch (e, s) {
      logger.log(
        'Error occurred while getting user data',
        error: e,
        stackTrace: s,
        logLevel: LogLevel.error,
      );
      rethrow;
    }
  }

  Future<void> _registerUser(UserEntity user) async {
    await _firestore
        .collection(FirestoreCollections.users)
        .doc(user.id)
        .set(user.toMap());
  }

  @override
  Future<void> registerCustomer({
    required UserEntity user,
    required Customer customer,
  }) async {
    await _registerUser(user);

    final profile = CustomerProfileDto(
      id: customer.id,
      name: customer.name,
      email: customer.email,
    );
    await _firestore
        .collection(FirestoreCollections.userProfiles)
        .doc(profile.id)
        .set(profile.toJson());
  }
}
