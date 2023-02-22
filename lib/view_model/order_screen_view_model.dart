import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import '../objects/order.dart' as orderObject;

class OrderScreenViewModel {
  BehaviorSubject<List<orderObject.Order>> uncompletedOrdersController =
      BehaviorSubject<List<orderObject.Order>>();
  BehaviorSubject<List<orderObject.Order>> completedOrdersController =
      BehaviorSubject<List<orderObject.Order>>();
  OrderScreenViewModel() {
    _fetchUncompletedOrders();
    _fetchCompletedOrders();
  }

  void _fetchUncompletedOrders() {
    FirebaseFirestore.instance
        .collectionGroup('orders')
        .where('completed', isEqualTo: false)
        .orderBy('dateAndTime', descending: true)
        .snapshots()
        .listen((snapshot) {
      List<orderObject.Order> _orders = snapshot.docs
          .map((doc) => orderObject.Order.fromSnapshot(doc))
          .toList();
      _orders = reOrder(_orders);
      uncompletedOrdersController.sink.add(_orders);
    });
  }

  void _fetchCompletedOrders() {
    FirebaseFirestore.instance
        .collectionGroup('orders')
        .where('completed', isEqualTo: true)
        .orderBy('dateAndTime', descending: true)
        .snapshots()
        .listen((snapshot) {
      List<orderObject.Order> _orders = snapshot.docs
          .map((doc) => orderObject.Order.fromSnapshot(doc))
          .toList();
      completedOrdersController.sink.add(_orders);
    });
  }

  Future<void> orderCompleted(orderObject.Order order) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final secureSnapshot = await transaction.get(FirebaseFirestore.instance
          .collection('customers')
          .doc(order.customerId)
          .collection('orders')
          .doc(order.id));
      transaction.update(secureSnapshot.reference, {'completed': true});
    });
  }

  List<orderObject.Order> reOrder(List<orderObject.Order> orders) {
    List<orderObject.Order> uncompletedOrders = orders;
    List<orderObject.Order> urgentOrders = [];
    List<orderObject.Order> veryHighOrders = [];
    List<orderObject.Order> highOrders = [];
    List<orderObject.Order> mediumOrders = [];
    List<orderObject.Order> lowOrders = [];
    for (int i = 0; i < uncompletedOrders.length; i++) {
      if (uncompletedOrders[i].priority.priorityType.priorityLevel == 4) {
        urgentOrders.add(uncompletedOrders[i]);
      } else if (uncompletedOrders[i].priority.priorityType.priorityLevel ==
          3) {
        veryHighOrders.add(uncompletedOrders[i]);
      } else if (uncompletedOrders[i].priority.priorityType.priorityLevel ==
          2) {
        highOrders.add(uncompletedOrders[i]);
      } else if (uncompletedOrders[i].priority.priorityType.priorityLevel ==
          1) {
        mediumOrders.add(uncompletedOrders[i]);
      } else {
        lowOrders.add(uncompletedOrders[i]);
      }
    }
    List<orderObject.Order> uncompletedReorderedOrders =
        urgentOrders + veryHighOrders + highOrders + mediumOrders + lowOrders;

    return uncompletedReorderedOrders;
  }

  void dispose() {
    uncompletedOrdersController.close();
  }
}
