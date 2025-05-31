class CategoryTransactionModel {
  final String title;
  final String subtitle;
  final String category;
  final String amount;
  final String icon;
  final bool isExpense;

  CategoryTransactionModel({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.amount,
    required this.icon,
    this.isExpense = false,
  });
}
