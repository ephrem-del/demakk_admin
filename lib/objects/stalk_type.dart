import 'package:demakk_admin/objects/stalk_category.dart';

class StockType {
  final StalkCategory stalkCategory;
  final String typeName;
  final String amharicTypeName;
  final int price;
  StockType({
    required this.typeName,
    required this.price,
    required this.stalkCategory,
    required this.amharicTypeName,
  });
}
