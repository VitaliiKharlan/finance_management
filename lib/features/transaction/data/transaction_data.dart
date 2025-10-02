class TransactionData {
  final String svgAsset;
  final String category;
  final DateTime timeAmdDate;
  final String title;
  final double amount;
  final bool isExpense;

  const TransactionData({
    required this.svgAsset,
    required this.category,
    required this.timeAmdDate,
    required this.title,
    required this.amount,
    this.isExpense = false,
  });
}
