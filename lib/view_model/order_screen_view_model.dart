import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import '../objects/order.dart' as order_object;
import '../objects/order_type.dart';

class OrderScreenViewModel {
  BehaviorSubject<List<order_object.Order>> uncompletedOrdersController =
      BehaviorSubject<List<order_object.Order>>();
  BehaviorSubject<List<order_object.Order>> completedOrdersController =
      BehaviorSubject<List<order_object.Order>>();
  OrderScreenViewModel() {
    _fetchUncompletedOrders();
    _fetchCompletedOrders();
  }

  Future<void> _fetchUncompletedOrders() async {
    Map<String, OrderType> allOrderTypesMap = {};
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('allOrderTypes').get();
    List<OrderType> listOfOrderTypes = querySnapshot.docs
        .map((doc) => OrderType(
            name: doc['name'],
            price: double.parse(doc['price'].toString()),
            amharicName: doc['amharicName']))
        .toList();
    for (int i = 0; i < listOfOrderTypes.length; i++) {
      allOrderTypesMap.addAll({listOfOrderTypes[i].name: listOfOrderTypes[i]});
    }

    FirebaseFirestore.instance
        .collectionGroup('orders')
        .where('completed', isEqualTo: false)
        .orderBy('dateAndTime', descending: true)
        .snapshots()
        .listen((snapshot) {
      List<order_object.Order> orders = snapshot.docs
          .map((doc) => order_object.Order.fromSnapshot(doc, allOrderTypesMap))
          .toList();
      orders = reOrder(orders);
      uncompletedOrdersController.sink.add(orders);
    });
  }

  Future<void> _fetchCompletedOrders() async {
    Map<String, OrderType> allOrderTypesMap = {};
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('allOrderTypes').get();
    List<OrderType> listOfOrderTypes = querySnapshot.docs
        .map((doc) => OrderType(
            name: doc['name'],
            price: double.parse(doc['price'].toString()),
            amharicName: doc['amharicName']))
        .toList();
    for (int i = 0; i < listOfOrderTypes.length; i++) {
      allOrderTypesMap.addAll({listOfOrderTypes[i].name: listOfOrderTypes[i]});
    }

    FirebaseFirestore.instance
        .collectionGroup('orders')
        .where('completed', isEqualTo: true)
        .orderBy('dateAndTime', descending: true)
        .snapshots()
        .listen((snapshot) {
      List<order_object.Order> orders = snapshot.docs
          .map((doc) => order_object.Order.fromSnapshot(doc, allOrderTypesMap))
          .toList();
      completedOrdersController.sink.add(orders);
    });
  }

  Future<void> orderCompleted(order_object.Order order) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final secureSnapshot = await transaction.get(FirebaseFirestore.instance
          .collection('customers')
          .doc(order.customerId)
          .collection('orders')
          .doc(order.id));
      transaction.update(secureSnapshot.reference, {'completed': true});
    });
  }

  List<order_object.Order> reOrder(List<order_object.Order> orders) {
    List<order_object.Order> uncompletedOrders = orders;
    List<order_object.Order> urgentOrders = [];
    List<order_object.Order> veryHighOrders = [];
    List<order_object.Order> highOrders = [];
    List<order_object.Order> mediumOrders = [];
    List<order_object.Order> lowOrders = [];
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
    List<order_object.Order> uncompletedReorderedOrders =
        urgentOrders + veryHighOrders + highOrders + mediumOrders + lowOrders;

    return uncompletedReorderedOrders;
  }

  void dispose() {
    uncompletedOrdersController.close();
  }
}
