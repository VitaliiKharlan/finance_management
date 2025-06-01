import '../models/category_transaction_model.dart';

Map<String, List<CategoryTransactionModel>> groupTransactionsByMonth(
  List<CategoryTransactionModel> transactions,
) {
  final Map<String, List<CategoryTransactionModel>> grouped = {};

  for (final transaction in transactions) {
    final month = extractMonth(transaction.timeAndDate);
    if (!grouped.containsKey(month)) {
      grouped[month] = [];
    }
    grouped[month]!.add(transaction);
  }

  return grouped;
}

String extractMonth(String timeAndDate) {
  try {
    final parts = timeAndDate.split(' - ');
    return parts.length > 1 ? parts[1].split(' ')[0] : 'Unknown';
  } catch (_) {
    return 'Unknown';
  }
}
