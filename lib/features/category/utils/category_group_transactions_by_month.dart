import 'package:intl/intl.dart';

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

String extractMonth(DateTime? timeAndDate) {
  try {
    return DateFormat.MMMM().format(timeAndDate!);
  } catch (_) {
    return 'Unknown';
  }
}
