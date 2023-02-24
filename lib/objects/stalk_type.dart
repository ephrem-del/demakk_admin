import 'package:demakk_admin/objects/stalk_category.dart';

class StalkType {
  final StalkCategory stalkCategory;
  final String typeName;
  final String amharicTypeName;
  final int price;
  StalkType({
    required this.typeName,
    required this.price,
    required this.stalkCategory,
    required this.amharicTypeName,
  });
}
