import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/core/constants/firestore_constants.dart';

import '../../../core/enums/category_enum.dart';
import '../models/category_transaction_dto.dart';

class ExpensesRepository {
  final FirebaseFirestore _firestore;

  ExpensesRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> addExpenseToCategory({
    required String category,
    required DateTime timeAndDate,
    required double amount,
    required String title,
    String? message,
  }) async {
    final categoryEnum = CategoryEnum.values.firstWhere(
      (e) =>
          e.label.toLowerCase() == category.toLowerCase() ||
          e.name.toLowerCase() == category.toLowerCase(),
      orElse: () => CategoryEnum.more,
    );

    final data = {
      'category': categoryEnum.name,
      'date': Timestamp.fromDate(timeAndDate),
      'amount': amount,
      'title': title,
      'message': message,
      'createdAt': Timestamp.now(),
    };

    await _firestore.collection(FirestoreCollections.transactions).add(data);
  }

  Future<void> updateExpense({
    required String id,
    required String category,
    required DateTime timeAndDate,
    required double amount,
    required String title,
    String? message,
  }) async {
    final categoryEnum = CategoryEnum.values.firstWhere(
      (e) =>
          e.label.toLowerCase() == category.toLowerCase() ||
          e.name.toLowerCase() == category.toLowerCase(),
      orElse: () => CategoryEnum.more,
    );

    final data = {
      'category': categoryEnum.name,
      'date': Timestamp.fromDate(timeAndDate),
      'amount': amount,
      'title': title,
      'message': message ?? '',
      'updatedAt': Timestamp.now(),
    };

    await _firestore
        .collection(FirestoreCollections.transactions)
        .doc(id)
        .update(data);
  }

  Future<void> deleteExpense(String id) async {
    await _firestore
        .collection(FirestoreCollections.transactions)
        .doc(id)
        .delete();
  }

  Future<CategoryTransactionDto?> getTransactionById(String id) async {
    final doc =
        await _firestore
            .collection(FirestoreCollections.transactions)
            .doc(id)
            .get();

    if (!doc.exists) return null;

    return CategoryTransactionDtoFirestore.fromFirestore(doc);
  }

  Future<double> getTotalExpense() async {
    final querySnapshot =
        await _firestore.collection(FirestoreCollections.transactions).get();

    double total = 0;
    for (var doc in querySnapshot.docs) {
      final amount = doc.data()['amount'];
      if (amount is num) {
        total += amount.toDouble();
      }
    }
    return total;
  }
}
