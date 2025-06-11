import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/enums/category_enum.dart';

part 'category_transaction_dto.g.dart';

DateTime _dateTimeFromJson(dynamic timestamp) {
  if (timestamp == null) {
    return DateTime.now();
  }
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  }
  if (timestamp is String) {
    return DateTime.parse(timestamp);
  }
  throw Exception('Unexpected date format');
}

@JsonSerializable()
class CategoryTransactionDto {
  final CategoryEnum category;
  final String title;

  @JsonKey(name: 'date', fromJson: _dateTimeFromJson)
  final DateTime? timeAndDate;

  final String amount;
  final String? icon;
  final bool isExpense;

  CategoryTransactionDto({
    required this.category,
    required this.title,
    required this.timeAndDate,
    required this.amount,
    required this.icon,
    this.isExpense = false,
  });

  factory CategoryTransactionDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryTransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryTransactionDtoToJson(this);

  CategoryTransactionDto copyWith({
    CategoryEnum? category,
    String? title,
    DateTime? timeAndDate,
    String? amount,
    String? icon,
    bool? isExpense,
  }) {
    return CategoryTransactionDto(
      category: category ?? this.category,
      title: title ?? this.title,
      timeAndDate: timeAndDate ?? this.timeAndDate,
      amount: amount ?? this.amount,
      icon: icon ?? this.icon,
      isExpense: isExpense ?? this.isExpense,
    );
  }
}
