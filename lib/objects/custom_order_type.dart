import 'package:demakk_admin/objects/order_type.dart';

// import 'customer.dart';

class CustomOrderType extends OrderType {
  final String type;
  //final Customer customer;
  //final String comment;
  String designCode;
  final String instructions;
  String imageLocation;
  CustomOrderType(
      {
      //   required this.comment,
      // required this.customer,
      required this.instructions,
      this.designCode = '',
      required this.type,
      this.imageLocation = '',
      required super.name,
      required super.price,
      required super.amharicName});
}
