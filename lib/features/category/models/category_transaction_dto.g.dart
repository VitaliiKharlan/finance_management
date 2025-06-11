// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryTransactionDto _$CategoryTransactionDtoFromJson(
  Map<String, dynamic> json,
) => CategoryTransactionDto(
  category: $enumDecode(_$CategoryEnumEnumMap, json['category']),
  title: json['title'] as String,
  timeAndDate: _dateTimeFromJson(json['date']),
  amount: (json['amount'] as num).toDouble(),
  icon: json['icon'] as String?,
  isExpense: json['isExpense'] as bool? ?? true,
);

Map<String, dynamic> _$CategoryTransactionDtoToJson(
  CategoryTransactionDto instance,
) => <String, dynamic>{
  'category': _$CategoryEnumEnumMap[instance.category]!,
  'title': instance.title,
  'date': instance.timeAndDate?.toIso8601String(),
  'amount': instance.amount,
  'icon': instance.icon,
  'isExpense': instance.isExpense,
};

const _$CategoryEnumEnumMap = {
  CategoryEnum.food: 'food',
  CategoryEnum.transport: 'transport',
  CategoryEnum.medicine: 'medicine',
  CategoryEnum.groceries: 'groceries',
  CategoryEnum.rent: 'rent',
  CategoryEnum.gifts: 'gifts',
  CategoryEnum.savings: 'savings',
  CategoryEnum.entertainment: 'entertainment',
  CategoryEnum.more: 'more',
};
