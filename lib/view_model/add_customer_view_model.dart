import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/customer.dart';

class AddCustomerViewModel {
  Future<bool> addCustomer(
      String name, String phoneNumber, String address) async {
    bool isSaved = false;
    Customer customer =
        Customer(name: name, phoneNumber: phoneNumber, address: address);
    try {
      FirebaseFirestore.instance.collection('customers').add(customer.toMap());
      isSaved = true;
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return isSaved;
  }
}
