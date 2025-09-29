import 'package:cloud_firestore/cloud_firestore.dart';

import '../../category/models/category_transaction_dto.dart';



class ExpenseRepository {
  final FirebaseFirestore _firestore;

  // final FirebaseAuth _auth;
  String? _userId;

  ExpenseRepository({
    FirebaseFirestore? firestore,
    // FirebaseAuth? auth,
    String? userId,
  })
      : _firestore = firestore ?? FirebaseFirestore.instance,
  // _auth = auth ?? FirebaseAuth.instance,
        _userId = userId;

  /// Позволяет обновить userId после авторизации
  void updateUserId(String userId) {
    _userId = userId;
  }


  CollectionReference<Map<String, dynamic>>? get _transactionsRef {
    if (_userId == null || _userId!.isEmpty) {
      return null; // пока нет userId
    }
    return _firestore.collection('users').doc(_userId).collection(
        'transactions');
  }

  Future<CategoryTransactionDto> addExpense(CategoryTransactionDto dto) async {
    final ref = _transactionsRef;
    if (ref == null) throw Exception('User not set');
    final docRef = await ref.add(dto.toJson()
      ..['createdAt'] = Timestamp.now());
    return dto.copyWith(id: docRef.id);
  }

  Future<CategoryTransactionDto> updateExpense(String id,
      CategoryTransactionDto dto) async {
    final ref = _transactionsRef;
    if (ref == null) throw Exception('User not set');
    await ref.doc(id).update(dto.toJson()
      ..['updatedAt'] = Timestamp.now());
    return dto.copyWith(id: id);
  }

  Future<void> deleteExpense(String id) async {
    final ref = _transactionsRef;
    if (ref == null) return;
    await ref.doc(id).delete();
  }

  Future<List<CategoryTransactionDto>> getAllTransactions() async {
    final ref = _transactionsRef;
    if (ref == null) return []; // пустой список пока нет userId
    final snapshot = await ref.orderBy('date', descending: true).get();
    return snapshot.docs
        .map((doc) => CategoryTransactionDtoFirestore.fromFirestore(doc))
        .toList();
  }

  Stream<List<CategoryTransactionDto>> getTransactionsStream() {
    final ref = _transactionsRef;
    if (ref == null) {
      return Stream.value([]); // пустой поток пока нет userId
    }
    return ref.orderBy('date', descending: true).snapshots().map(
          (snapshot) =>
          snapshot.docs
              .map((doc) => CategoryTransactionDtoFirestore.fromFirestore(doc))
              .toList(),
    );
  }

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