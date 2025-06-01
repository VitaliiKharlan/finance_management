class CategoryTransactionModel {
  final String category;
  final String title;
  final String timeAndDate;
  final String amount;
  final String icon;
  final bool isExpense;

  CategoryTransactionModel({
    required this.category,
    required this.title,
    required this.timeAndDate,
    required this.amount,
    required this.icon,
    this.isExpense = false,
  });
}
