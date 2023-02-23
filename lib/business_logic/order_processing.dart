// import 'package:demakk_admin/objects/priority_type.dart';
// import 'package:demakk_admin/widgets/history_tile.dart';
// import 'package:demakk_admin/widgets/order_tile.dart';
//
// import '../objects/order.dart';
// import '../resources/order_resource.dart';
//
// List<Order> uncompletedOrders = <Order>[];
// List<Order> completedOrders = <Order>[];
//
// List<OrderTile> getUncompletedOrderTiles() {
//   for (int i = 0; i < orders.length; i++) {
//     if (orders[i].completed == false) {
//       uncompletedOrders.add(orders[i]);
//     } else {}
//   }
//   List<Order> urgentOrders = [];
//   List<Order> veryHighOrders = [];
//   List<Order> highOrders = [];
//   List<Order> mediumOrders = [];
//   List<Order> lowOrders = [];
//   for (int i = 0; i < uncompletedOrders.length; i++) {
//     if (uncompletedOrders[i].priority.priorityType.priorityLevel == 4) {
//       urgentOrders.add(uncompletedOrders[i]);
//     } else if (uncompletedOrders[i].priority.priorityType.priorityLevel == 3) {
//       veryHighOrders.add(uncompletedOrders[i]);
//     } else if (uncompletedOrders[i].priority.priorityType.priorityLevel == 2) {
//       highOrders.add(uncompletedOrders[i]);
//     } else if (uncompletedOrders[i].priority.priorityType.priorityLevel == 1) {
//       mediumOrders.add(uncompletedOrders[i]);
//     } else {
//       lowOrders.add(uncompletedOrders[i]);
//     }
//   }
//   List<Order> uncompletedReorderedOrders =
//       urgentOrders + veryHighOrders + highOrders + mediumOrders + lowOrders;
//
//   List<OrderTile> orderTiles = uncompletedReorderedOrders
//       .map((order) => OrderTile(
//             order: order,
//           ))
//       .toList();
//
//   return orderTiles;
// }
//
// List<HistoryTile> getCompletedOrderTiles() {
//   for (int i = 0; i < orders.length; i++) {
//     if (orders[i].completed) {
//       completedOrders.add(orders[i]);
//     } else {}
//   }
//   List<HistoryTile> historyTiles =
//       completedOrders.map((order) => HistoryTile(order: order)).toList();
//
//   return historyTiles;
// }
