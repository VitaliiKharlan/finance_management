import '../models/category_transaction_dto.dart';

Map<String, List<CategoryTransactionDto>> groupTransactionsByMonth(
  List<CategoryTransactionDto> transactions,
) {
  final Map<String, List<CategoryTransactionDto>> grouped = {};

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
