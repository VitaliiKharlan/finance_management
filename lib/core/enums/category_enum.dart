// enum CategoryEnum {
//   food('🍔 Food'),
//   transport('🚌 Transport'),
//   medicine('💊 Medicine'),
//   groceries('🛒 Groceries'),
//   rent('🏠 Rent'),
//   gifts('🎁 Gifts'),
//   entertainment('🎮 Entertainment');
//
//   final String label;
//   const CategoryEnum(this.label);
// }

import '../theme/app_icons.dart';

enum CategoryEnum {
  food,
  transport,
  medicine,
  groceries,
  rent,
  gifts,
  savings,
  entertainment,
  more;

  String get label {
    switch (this) {
      case CategoryEnum.food:
        return 'Food';
      case CategoryEnum.transport:
        return 'Transport';
      case CategoryEnum.medicine:
        return 'Medicine';
      case CategoryEnum.groceries:
        return 'Groceries';
      case CategoryEnum.rent:
        return 'Rent';
      case CategoryEnum.gifts:
        return 'Gifts';
      case CategoryEnum.savings:
        return 'Savings';
      case CategoryEnum.entertainment:
        return 'Entertainment';
      case CategoryEnum.more:
        return 'More';
    }
  }

  String get iconPath {
    switch (this) {
      case CategoryEnum.food:
        return AppIcons.iconCategoriesFood;
      case CategoryEnum.transport:
        return AppIcons.iconCategoriesTransport;
      case CategoryEnum.medicine:
        return AppIcons.iconCategoriesMedicine;
      case CategoryEnum.groceries:
        return AppIcons.iconCategoriesGroceries;
      case CategoryEnum.rent:
        return AppIcons.iconCategoriesRent;
      case CategoryEnum.gifts:
        return AppIcons.iconCategoriesGifts;
      case CategoryEnum.savings:
        return AppIcons.iconCategoriesSavings;
      case CategoryEnum.entertainment:
        return AppIcons.iconCategoriesEntertainment;
      case CategoryEnum.more:
        return AppIcons.iconCategoriesMore;
    }
  }

  static CategoryEnum fromLabel(String label) {
    return CategoryEnum.values.firstWhere(
      (e) => e.label.toLowerCase() == label.toLowerCase(),
      orElse: () => CategoryEnum.more,
    );
  }

  static CategoryEnum fromString(String value) {
    return CategoryEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => CategoryEnum.more,
    );
  }
}
