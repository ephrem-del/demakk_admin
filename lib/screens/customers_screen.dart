//import 'package:demakk_admin/objects/customer.dart';
import 'package:demakk_admin/screens/supplier_detail_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../objects/customer.dart';
import '../objects/supplier.dart';
import '../view_model/customer_screen_view_model.dart';
import '../view_model/supplier_screen_view_model.dart';
import '../widgets/supplier_tile.dart';
//import '../business_logic/customers_processing.dart';
// import '../resources/customer_list.dart';
// import '../resources/supplier_resource.dart';
import '../widgets/customer_tile.dart';
//import 'add_customer_screen.dart';
import 'customer_detail_screen.dart';
import 'customer_or_supplier_screen.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  late CustomerScreenViewModel _customerScreenViewModel;
  late SupplierScreenViewModel _supplierScreenViewModel;

  @override
  void initState() {
    super.initState();
    _customerScreenViewModel = CustomerScreenViewModel();
    _supplierScreenViewModel = SupplierScreenViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CustomerOrSupplierScreen();
                }));
              },
              backgroundColor: primaryColor,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: SafeArea(
              child: Column(
                children: [
                  TabBar(
                    labelColor: primaryColor,
                    indicatorColor: primaryColor,
                    labelStyle: subTitleTextStyle,
                    tabs: [
                      amharic
                          ? const Tab(
                              text: 'ደንበኞች',
                            )
                          : const Tab(
                              text: 'Customers',
                            ),
                      amharic
                          ? const Tab(
                              text: 'አቅራቢዎች',
                            )
                          : const Tab(
                              text: 'Suppliers',
                            ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        customerTab(context, _customerScreenViewModel),
                        supplierTab(context, _supplierScreenViewModel),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

Widget customerTab(context, CustomerScreenViewModel viewModel) {
  return StreamBuilder<List<Customer>>(
      stream: viewModel.customersBehaviorSubjectController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading');
          default:
            if (!snapshot.hasData) {
              return const Text('No Data');
            }
        }
        final List<Customer> customers = snapshot.data!;
        return ListView(
            children: customers
                .map((customer) => CustomerTile(
                      customer: customer,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CustomerDetailScreen(
                                customer: customer,
                              );
                            },
                          ),
                        );
                      },
                    ))
                .toList());
      });
//
// //children: customerTiles,
//   );
}

Widget supplierTab(BuildContext context, SupplierScreenViewModel viewModel) {
  return StreamBuilder<List<Supplier>>(
      stream: viewModel.suppliersBehaviorSubjectController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error ');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading');
          default:
            if (!snapshot.hasData) {
              return const Text('No data');
            }
        }

        List<Supplier> suppliers = snapshot.data!;
        return ListView(
          children: suppliers
              .map((supplier) => SupplierTile(
                    supplier: supplier,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SupplierDetailScreen(
                              supplier: supplier,
                            );
                          },
                        ),
                      );
                    },
                  ))
              .toList(),
//children: customerTiles,
        );
      });
}
