import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_management/core/constants/firestore_constants.dart';

import '../../../core/enums/category_enum.dart';

class ExpensesRepository {
  final FirebaseFirestore _firestore;

  ExpensesRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> addExpenseToCategory({
    required String category,
    required DateTime date,
    required String amount,
    required String title,
    required String message,
  }) async {
    final catEnum = CategoryEnum.values.firstWhere(
      (e) =>
          e.label.toLowerCase() == category.toLowerCase() ||
          e.name.toLowerCase() == category.toLowerCase(),
      orElse: () => CategoryEnum.more,
    );

    final data = {
      'category': catEnum.name,
      'date': date.toIso8601String(),
      'formattedDate': _formatDate(date),
      'amount': amount,
      'title': title,
      'message': message,
      'createdAt': Timestamp.now(),
    };

    await _firestore.collection(FirestoreCollections.transactions).add(data);
  }

  String _formatDate(DateTime date) {
    return '${_monthName(date.month)} ${date.day}, ${date.year}';
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
