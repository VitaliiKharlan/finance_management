import '../../../core/enums/category_enum.dart';

class CategoryTransactionDto {
  final CategoryEnum category;
  final String title;
  final String timeAndDate;
  final String amount;
  final String icon;
  final bool isExpense;

  CategoryTransactionDto({
    required this.category,
    required this.title,
    required this.timeAndDate,
    required this.amount,
    required this.icon,
    this.isExpense = false,
  });

  factory CategoryTransactionDto.fromMap(Map<String, dynamic> map) {
    return CategoryTransactionDto(
      category: CategoryEnum.fromString(map['category'] ?? 'more'),
      title: map['title'] ?? '',
      timeAndDate: map['timeAndDate'] ?? '',
      amount: map['amount'] ?? '',
      icon: map['icon'] ?? '',
      isExpense: map['isExpense'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category.name,
      'title': title,
      'timeAndDate': timeAndDate,
      'amount': amount,
      'icon': icon,
      'isExpense': isExpense,
    };
  }
}
