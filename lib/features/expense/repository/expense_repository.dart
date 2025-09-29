import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../category/models/category_transaction_dto.dart';
import 'i_expense_repository.dart';

class ExpenseRepository implements IExpenseRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ExpenseRepository({FirebaseFirestore? firestore, FirebaseAuth? auth})
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _auth = auth ?? FirebaseAuth.instance;

  CollectionReference<Map<String, dynamic>>? get _transactionsRef {
    final userId = _auth.currentUser?.uid;
    if (userId == null || userId.isEmpty) {
      return null;
    }
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions');
  }

  @override
  Future<CategoryTransactionDto> addExpense(CategoryTransactionDto dto) async {
    final ref = _transactionsRef;
    if (ref == null) throw Exception('User not set');
    final docRef = await ref.add(dto.toJson()..['createdAt'] = Timestamp.now());
    return dto.copyWith(id: docRef.id);
  }

  @override
  Future<CategoryTransactionDto> updateExpense(
    String id,
    CategoryTransactionDto dto,
  ) async {
    final ref = _transactionsRef;
    if (ref == null) throw Exception('User not set');
    await ref.doc(id).update(dto.toJson()..['updatedAt'] = Timestamp.now());
    return dto.copyWith(id: id);
  }

  @override
  Future<void> deleteExpense(String id) async {
    final ref = _transactionsRef;
    if (ref == null) return;
    await ref.doc(id).delete();
  }

  @override
  Future<List<CategoryTransactionDto>> getAllTransactions() async {
    final ref = _transactionsRef;
    if (ref == null) return [];
    final snapshot = await ref.orderBy('date', descending: true).get();
    return snapshot.docs
        .map((doc) => CategoryTransactionDtoFirestore.fromFirestore(doc))
        .toList();
  }

  @override
  Stream<List<CategoryTransactionDto>> getTransactionsStream() {
    final ref = _transactionsRef;
    if (ref == null) {
      return Stream.value([]);
    }
    return ref
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map(
                    (doc) => CategoryTransactionDtoFirestore.fromFirestore(doc),
                  )
                  .toList(),
        );
  }

  @override
  Future<double> getTotalExpense() async {
    final ref = _transactionsRef;
    if (ref == null) return 0.0;
    final snapshot = await ref.get();
    double total = 0;
    for (var doc in snapshot.docs) {
      final amount = doc.data()['amount'];
      if (amount is num) total += amount.toDouble();
    }
    return total;
  }
}
