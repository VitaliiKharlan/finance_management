import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/core/constants/firestore_constants.dart';

import '../../../core/enums/category_enum.dart';

class ExpensesRepository {
  final FirebaseFirestore _firestore;

  ExpensesRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> addExpenseToCategory({
    required String category,
    required DateTime timeAndDate,
    required double amount,
    required String title,
    required String message,
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
}
