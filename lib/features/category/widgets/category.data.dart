class CategoryData {
  final String svgAsset;
  final String title;
  final String subtitle;
  final String category;
  final String amount;
  final bool isExpense;

  const CategoryData({
    required this.svgAsset,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.amount,
    this.isExpense = false,
  });
}
