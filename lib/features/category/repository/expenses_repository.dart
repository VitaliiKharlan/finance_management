import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/core/constants/firestore_constants.dart';

import '../models/category_transaction_dto.dart';

class ExpensesRepository {
  final FirebaseFirestore _firestore;

  ExpensesRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<CategoryTransactionDto> addExpense(CategoryTransactionDto dto) async {
    final docRef = await _firestore
        .collection(FirestoreCollections.transactions)
        .add(dto.toJson()..['createdAt'] = Timestamp.now());

    return dto.copyWith(id: docRef.id);
  }

  Future<CategoryTransactionDto> updateExpense(
    String id,
    CategoryTransactionDto dto,
  ) async {
    await _firestore
        .collection(FirestoreCollections.transactions)
        .doc(id)
        .update(dto.toJson()..['updatedAt'] = Timestamp.now());

    return dto.copyWith(id: id);
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

  Future<List<CategoryTransactionDto>> getAllTransactions() async {
    final querySnapshot =
        await _firestore
            .collection(FirestoreCollections.transactions)
            .orderBy('date', descending: true)
            .get();

    return querySnapshot.docs
        .map((doc) => CategoryTransactionDtoFirestore.fromFirestore(doc))
        .toList();
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


  Stream<List<CategoryTransactionDto>> getTransactionsStream() {
    return _firestore
        .collection(FirestoreCollections.transactions)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs
            .map((doc) => CategoryTransactionDtoFirestore.fromFirestore(doc))
            .toList());
  }
}
