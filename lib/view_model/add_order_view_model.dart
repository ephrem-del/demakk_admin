import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/date_and_time.dart';
import 'package:demakk_admin/objects/order.dart' as orderFromOrder;
import 'package:rxdart/rxdart.dart';

import '../objects/customer.dart';
import '../objects/order_type.dart';
import '../objects/priority.dart';

class AddOrderViewModel {
  final BehaviorSubject<List<Customer>> customerList =
      BehaviorSubject<List<Customer>>();
  AddOrderViewModel() {
    _fetchCustomers();
  }

  Future<void> _fetchCustomers() async {
    FirebaseFirestore.instance
        .collection('customers')
        .orderBy('name', descending: false)
        .snapshots()
        .listen((snapshot) {
      List<Customer> customers =
          snapshot.docs.map((doc) => Customer.fromSnapshot(doc)).toList();
      customerList.sink.add(customers);
    });
  }

  Future<bool> addOrder(
    OrderType type,
    int amount,
    String comment,
    Priority priority,
    String customerId,
    double paid,
    String customerName,
  ) async {
    orderFromOrder.Order order = orderFromOrder.Order(
      type: type,
      amount: amount,
      comment: comment,
      priority: priority,
      customerId: customerId,
      completed: false,
      paid: paid,
      customerName: customerName,
      dateAndTime: DateAndTime(
        dateTime: DateTime.now(),
      ),
    );
    bool isSaved = false;
    try {
      FirebaseFirestore.instance
          .collection('customers')
          .doc(customerId)
          .collection('orders')
          .add(order.toMap());
      isSaved = true;
      print('trying really trying');
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return isSaved;
  }
}
